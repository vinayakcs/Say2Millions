class UnpublishedarticlesController < ApplicationController
 include SessionsHelper
 before_action :redirect_for_guest_user
 def new
 end
 def edit
  @unpublishedarticle = current_user.unpublishedarticle
 end
 def create
   @unpublishedarticle = Unpublishedarticle.new
   @unpublishedarticle.title = params[:unpublishedarticle][:title]
   @unpublishedarticle.user_id=current_user.id
   @unpublishedarticle.fbuid=current_user.uid
   @unpublishedarticle.category=params[:unpublishedarticle][:category]
   @unpublishedarticle.description = params[:unpublishedarticle][:description]
   current_user.unpublishedarticle= @unpublishedarticle
   if current_user.save
    redirect_to root_url ,:notice => "Thank you for submitting your post, it may be viewed by millons !!"
    return
   else
    err_msg=""
    @unpublishedarticle.errors.full_messages.each do |msg| 
     err_msg+=msg+","
     Rails.logger.error("unpublishedarticle Creation fails".to_s+msg)
    end
    
    redirect_to current_user, :notice => "Post not submitted errors: "+err_msg.chop
   end
 end

 def update
   @unpublishedarticle = current_user.unpublishedarticle
   @unpublishedarticle.title = params[:unpublishedarticle][:title]
   @unpublishedarticle.category=params[:unpublishedarticle][:category]
   @unpublishedarticle.description = params[:unpublishedarticle][:description]
   current_user.unpublishedarticles << @unpublishedarticle
   if current_user.save
    redirect_to root_url ,:notice => "updated successfully"
    return
   else
    err_msg=""
    @unpublishedarticle.errors.full_messages.each do |msg| 
     err_msg+=msg+","
     Rails.logger.error("unpublishedarticle updation fails".to_s+msg)
    end
    
    redirect_to current_user, :notice => "Post not updated errors: "+err_msg.chop
   end
 end
end
