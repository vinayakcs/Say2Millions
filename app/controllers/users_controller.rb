class UsersController < ApplicationController
 include SessionsHelper
 before_action :redirect_for_guest_user, :except => [:show]
 def show 
  @user = User.find(params[:id])
  if @user.unpublishedarticle.nil?
   flash.now[:notice] = 'Add your article !, added articles will be automatically published when you are chosen as lucky celebrity'
  end
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  puts params
  @user=User.find(params[:id])
  if !params[:user].blank?
   is_param_ok=true
   @user.name=params[:user][:name] if !params[:user][:name].blank?
   @user.last_name=params[:user][:last_name] if  !params[:user][:last_name].blank?
   @user.user_description=params[:user][:user_description] if  !params[:user][:user_description].blank?
  end
  
  respond_to do |format|
    if is_param_ok and @user.save
      format.html { redirect_to(@user, :notice => 'Profile was successfully updated.') }
    else
      format.html {redirect_to(@user, :notice => 'Profile update fails') }
    end
  end
 end


end
