class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart, :current_user
  # before_action :require_login
  

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def current_cart
    current_user.current_cart
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path unless logged_in?
  end
end
