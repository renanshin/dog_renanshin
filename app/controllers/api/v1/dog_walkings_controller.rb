module Api::V1
  class DogWalkingsController < ApplicationController
    before_action :set_dog_walking, only: [:show, :update, :destroy]

    # GET /dog_walkings
    def index
      # A Lógica dos filtros foi utilizada para poder se reutilizadas com novos
      #   possíveis parâmetros de datas
      return_filter = params['return_filter']

      if return_filter === 'All'
         @dog_walkings = DogWalking.all
      else
         @dog_walkings = DogWalking.future_walkings
      end
      render json: @dog_walkings.page(params[:page]).per(params[:per_page])
    end

    # GET /dog_walkings/1
    def show
      real_duration = @dog_walking.calc_real_dutation(@dog_walking.start_datetime,@dog_walking.finish_datetime)
      render json: real_duration
    end

    # POST /dog_walkings
    def create
      @dog_walking = DogWalking.new(dog_walking_params)

      if @dog_walking.save
        render json: @dog_walking, status: :created, location: @dog_walking
      else
        render json: @dog_walking.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /dog_walkings/1
    def update
      if @dog_walking.update(dog_walking_params)
        render json: @dog_walking
      else
        render json: @dog_walking.errors, status: :unprocessable_entity
      end
    end

    # DELETE /dog_walkings/1
    def destroy
      @dog_walking.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dog_walking
        @dog_walking = DogWalking.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def dog_walking_params
        params.require(:dog_walking).permit(:scheduled_date, :price, :duration_minutes, :latitude, :longitude, :pets_number, :start_datetime, :finish_datetime)
      end
  end
end
