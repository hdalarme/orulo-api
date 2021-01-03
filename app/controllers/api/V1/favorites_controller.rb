class Api::V1::FavoritesController < ApplicationController
    before_action :set_favorite, only: [:destroy]

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

    def index
        @favorite = Favorite.joins(:building)
        .select('favorites.id as favorite_id, buildings.orulo_building_id as id, favorites.user_id')
        .where(["orulo_building_id = ? and user_id = ?", params[:orulo_building_id], params[:user_id] ])
        .limit(1)
        #@fav = Building.where(["orulo_building_id = ?"], :id)
        render json: @favorite
    end

    def set_favorite
        @favorite = Favorite.find(params[:id])
    end

    def building_params
        params.require(:building).permit(:name, :address, :orulo_building_id)
    end

    def favorites_params
        params.require(:favorite).permit(:user_id)
    end

end
