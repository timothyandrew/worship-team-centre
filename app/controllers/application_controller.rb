class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authorize_rack_mini_profiler
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def track_event(message, options = {})
    @tracker ||= Mixpanel::Tracker.new(Figaro.env.mixpanel_token)
    @tracker.track(current_user.id, message, options)
    @tracker.people.set(current_user.id, {
      '$name'    => current_user.name,
      '$email'   => current_user.email,
      '$created' => current_user.created_at
    })
  end

  def authorize_rack_mini_profiler
    if params[:debug].present?
      Rack::MiniProfiler.authorize_request
    end
  end
end
