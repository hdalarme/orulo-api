class Api::V1::FavoritesController < ApplicationController

    def create
        ActiveRecord::Base.transaction do
            create_building
            create_favorite

            render json: @favorite
        end
    end

    def create_favorite
        @favorite = Favorite.new(favorites_params)

        @favorite.building_id = @building.id
        @favorite.save!
    end

    def create_building
        @building = Building.find_or_create_by!(building_params)
    end
    
    def destroy
        @favorite.destroy
    end

    def show
        render json: @favorite
    end

    def building_params
        params.require(:building).permit(:name, :address, :orulo_building_id)
    end

    def favorites_params
        params.require(:favorite).permit(:user_id)
    end

end
