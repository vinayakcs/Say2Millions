class VotesController < ApplicationController
 include SanitizableParams
 include SessionsHelper
 before_filter :redirect_for_guest_user 
 @@voteType=["up","down"]





 def create
  manage_vote
 end

 def update
  manage_vote
 end


 private
 def manage_vote
  @article = Article.find(params[:article_id])
  @vote_saved = false 
  @voteType=params[:vote][:vote_type] 
  @vote = Vote.getVoteByUserForArticle(current_user.id,@article.id)
  @new_vote_count=0
  @vote_saved=false
  if !@article.nil? && @@voteType.include?(@voteType)
   if @vote.nil? #create
    @vote=Vote.new
    @vote.user_uid=current_user.uid
    @vote.user_id=current_user.id
    @vote.vote_type= @voteType
    @vote.article_id=@article.id
    voteCount = @article.vote_count || 0
    if @vote.save
     @vote_saved = true
     if @voteType=="up"
      @article.update_vote_count(true,1)
      voteCount=voteCount+1
     else
      @article.update_vote_count(false,1)
      voteCount=voteCount-1
     end
     @new_vote_count = voteCount
    end   
   else #update
    voteCount = @article.vote_count || 0
    if !@article.nil? && @@voteType.include?(@voteType) && @voteType!=@vote.vote_type && !@vote.nil? && @vote.update_attributes(vote_type: @voteType)
     @vote_saved=true
     if @voteType=="up"
      @article.update_vote_count(true,1)
      voteCount=voteCount+1
     elsif @voteType=="down"
      @article.update_vote_count(false,1)
      voteCount=voteCount-1
     end
    end
    @new_vote_count = voteCount

   end
  end
  respond_to do |format|
   format.js
  end
 end



end
