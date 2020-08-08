class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_action_cable_identifier
  before_action :create_body_id
  around_action :set_time_zone, if: :current_user

  ##################################################
  # Site Initalizing actions
  ##################################################

  # Set the body id to 'controller-action'
  def create_body_id
    @body_id = "#{params[:controller].gsub('_', '-')}-#{params[:action].gsub('_', '-')}"
  end

  ##################################################
  # Custom pathing for devise sign in and sign out redirects
  ##################################################

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end


  ##################################################
  # Rescue from Pundit unauthorized Errors
  ##################################################

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  private

  # Set current user as a encrypted cookie for reflex useage
  def set_action_cable_identifier
    cookies.encrypted[:user_id] = current_user&.id
  end

  # Set the timezone for the user based on the user's time_zone preference
  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
