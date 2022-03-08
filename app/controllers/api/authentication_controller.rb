module Api
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
    skip_before_action :verify_authenticity_token

    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password])

      if command.success?
        cookies['ACCESS_TOKEN'] = {
          :value => command.result,
          :expires => 24.hours.from_now,
          :domain => :all
        }
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
  end
end
