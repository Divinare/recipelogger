class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :currently_signed_in?, :is_not_admin, :is_admin

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
    if current_user.nil? || current_user.admin.nil? || current_user.admin == false
      return true
    end
    return false
  end

  def is_admin
    if current_user.nil? || current_user.admin.nil? || current_user.admin == false
      return false
    end
    return true
  end

  def ensure_that_is_admin
  #  redirect_to_back, :notice => 'Insufficient rights' if is_not_admin
    if is_not_admin
      redirect_to_back('Insufficient rights')
    end
  end

  def redirect_to_back(default = root_url, notice)
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back, :notice => notice
    else
      redirect_to default, :notice => notice
    end
  end


end
