class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_user_session(token = nil)
    token = params[:token] unless token.present?
    user_session = query_user_session(token)
    unless user_session_active?(user_session)
      head :forbidden
    end
  end

  def query_user_session(token)
    UserSession.where(token: token, archived: false).first
  end

  def user_session_active?(user_session)
    user_session.present? && user_session.active?
  end
end
