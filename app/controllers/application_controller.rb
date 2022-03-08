class ApplicationController < ActionController::API
  before_action :set_csrf_cookie
  before_action :authenticate_request

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception

  attr_reader :current_user

  def cookie
    "ok"
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  private

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = {
      value: form_authenticity_token,
      domain: :all
    }
  end
end
