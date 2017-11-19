class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

   def logged_in?
    !!current_user
  end

  def authorize
    redirect_to '/login' unless logged_in?
  end

  def redirect_if_not_authorized(owner)
    redirect_to '/_not_authorized' unless authorized?(owner)
  end

  def authorized?(owner)
    # comparing current_user object with author object ****
    current_user == owner
  end


end
