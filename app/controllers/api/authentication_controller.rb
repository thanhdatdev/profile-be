module Api
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
    skip_before_action :verify_authenticity_token

    def get_refresh_token
      command = AuthenticateUser.call(params[:email], params[:password])

      if !command
        render json: {
          error_code: :invalid_grant,
          error: 'Error: invalid_authentication_params'
        }, status: :bad_request
      end

      if command.success?
        cookies['REFRESH_TOKEN'] = {
          :value => command.result,
          :expires => 10.days.from_now,
          :domain => :all
        }
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

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
