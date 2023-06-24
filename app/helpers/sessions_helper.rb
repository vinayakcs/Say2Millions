module SessionsHelper

  def sign_in(user)
    remember_token = User.get_remember_token
    cookies.permanent.signed[:remember_token] = remember_token
    user.update_attribute(:remember_token, remember_token)
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end
  def current_user
    @current_user ||= User.find_by(remember_token: cookies.signed[:remember_token]) if cookies[:remember_token]
  end
  def is_content_owner(user_id) 
    return (check_auth_user? and @current_user.id==user_id) 
  end

  def check_auth_user?
   if current_user.nil? || self.current_user.remember_token.nil? || self.current_user.remember_token!=cookies.signed[:remember_token]
    return false
   else
    return true
   end
  end 

  
  def redirect_for_guest_user
   if !check_auth_user? 
    flash[:error] = "Please Login, to continue"
    redirect_to root_path 
   end
  end
end
