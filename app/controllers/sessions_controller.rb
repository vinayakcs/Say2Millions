class SessionsController < ApplicationController 
 include SessionsHelper

  def create
   om_hash=request.env
   om_hash=
   if !check_auth_user?
    auth = User.where(:provider => om_hash["omniauth.auth"]['provider'], :uid => om_hash["omniauth.auth"]['uid']).first || User.create_with_omniauth(om_hash)
    if auth 
     sign_in(auth)
     redirect_to root_url, :notice => "Logged In"
    else  
     redirect_to root_url, :notice => "Something went wrong!, try again or report this issue"
    end
   else
    redirect_to root_url, :notice => "Already Logged In"
   end
  end

  def failure
   redirect_to root_url, :notice => "Try again, signing is unsuccesfull"
  end
  def destroy
    sign_out
    redirect_to root_url, :notice => "Good bye"
  end
end
