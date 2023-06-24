class CommentsController < ApplicationController
 include SanitizableParams
 before_action :redirect_for_guest_user


 def update
  @comment = Comment.find(params[:id])
  @comment_updated=false
  if !@comment.nil? && (current_user.id==@comment.commentable_id) && @comment.update_attributes(description: params[:comment][:description])
   @comment_updated=true
  end
  respond_to do |format|
   format.js
  end
 end


 def destroy
  @commentable = find_commentable
  @comment=Comment.find(params[:id])
  @comment_deleted = false
  
  if !@commentable.nil? && !@comment.nil? && (current_user.id==@comment.commentable_id)
   @comment.destroy
   commentCount=@commentable.comment_count || 0
   if @comment.destroyed?
    @comment_deleted = true
    @commentable.update_comment_count(false,1)
    commentCount=commentCount-1
   end
   @new_comment_count = commentCount
  end
  respond_to do |format|
   format.js
  end

 end

 def create
   @commentable = find_commentable
   description = ""
   @comment_saved = false
   if !@commentable.nil? && !params[:comment].nil?
    @comment = @commentable.comments.new
    @comment.description = params[:comment][:description]
    @comment.user_uid = current_user.uid
    commentCount=@commentable.comment_count || 0
    if @comment.save
     @comment_saved = true
     @commentable.update_comment_count(true,1)
     commentCount=commentCount+1
    end
    @new_comment_count = commentCount
   end
   respond_to do |format|
    format.js
   end
 end

 private
 
 def find_commentable
   params.each do |name, value|
     if name =~ /(.+)_id$/
       return $1.classify.constantize.find(value)
     end
   end
   nil
 end


end
