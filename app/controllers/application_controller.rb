class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def not_allowed
    raise ActionController::RoutingError.new('Not Allowed')
  end

private

  def current_user
    user_id = cookies.permanent.signed[:user_id]
    logger.info "user_id: #{user_id}"
    @current_user ||= User.find_by_uid(user_id) if user_id.present?
  end
  helper_method :current_user

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = current_user.access_token
      config.access_token_secret = current_user.access_token_secret
    end
  end
end
