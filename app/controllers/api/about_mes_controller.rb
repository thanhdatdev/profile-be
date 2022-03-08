module Api
  class AboutMesController < ApiController
    def index
      @about = AboutMe.all
      render json: @about
    end

    def show
      @about = AboutMe.find(params[:id])
      render json: @about
    end

    def create
      @about = AboutMe.create(
        dob: params[:dob],
        from: params[:from],
        career: params[:career],
        current_job: params[:current_job],
        funny: params[:funny]
      )
      render json: @about
    end

    def update
      @about = AboutMe.find(params[:id])
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
      @about = AboutMe.all
      @about = AboutMe.find(params[:id])
      @about.destroy
      render json: @about
    end
  end
end
