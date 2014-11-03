class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_last_seen_at, if: proc { |p| current_user }
  
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
  end
  
  helper_method :current_user
end
