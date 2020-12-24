class Api::V1::OruloBuildingsController < Api::V1::ApiController # ApplicationController

    def index
        render json: GetOruloBuildingListService.new().call
    end

    def show
        render json: GetOruloBuildingDetailsService.new(params[:id]).call
    end

end

