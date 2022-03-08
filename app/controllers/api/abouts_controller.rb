module Api
  class AboutsController < ApplicationController
    def index
      @about = About.all
      render json: @about
    end

    def show
      @about = About.find(params[:id])
      render json: @about
    end

    def create
      @about = About.create(
        dob: params[:dob],
        from: params[:from],
        career: params[:career],
        current_job: params[:current_job],
        funny: params[:funny]
      )
      render json: @about
    end

    def update
      @about = About.find(params[:id])
      @about.update(
        dob: params[:dob],
        from: params[:from],
        career: params[:career],
        current_job: params[:current_job],
        funny: params[:funny]
      )
      render json: @about
    end

    def destroy
      @about = About.all
      @about = About.find(params[:id])
      @about.destroy
      render json: @about
    end
  end
end
