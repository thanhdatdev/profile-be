module Api
  class BaseApiController < ApplicationController
    skip_before_action :authenticate_request
  end
end
