class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :currently_signed_in?, :is_not_admin

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def currently_signed_in?(user)
    current_user == user
  end

  def ensure_that_signed_in
    redirect_to signin_path, :notice => 'you should be signed in' if current_user.nil?
  end

  def is_right_user(id)
    if current_user.id.to_s == id.to_s
      if params[:id]
        return true
      end
      return false
    end
  end

  def is_not_admin
    if current_user.admin.nil? || current_user.admin == false
      return true
    end
    return false
  end

  def ensure_that_is_admin
    redirect_to :back, :notice => 'Insufficient rights' if not current_user.admin
  end

end
