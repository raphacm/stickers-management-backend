module API
  module V1    
    class StickersController < ApplicationController
      before_action :load_collection, :load_stickers, only: %i[index]
      before_action :load_sticker, only: %i[update]

      def index
        render json: @stickers, status :ok
      end
    
      def update
        if @sticker.update(sticker_params)
          render json: @sticker
        else
          render json: @sticker.errors, status: :unprocessable_entity
        end
      end
    
      private
        def load_collection          
          @collection = Collection.by_uuid(params[:collection_id])&.first
          return head :not_found if @collection.blank?
        end

        def load_stickers
          @sticker = Sticker.by_collection(@collection)

          return head :not_found if @stickers.empty?
        end
    
        def load_sticker
          @sticker = Sticker.by_uuid(params[:id])&.first

          return head :not_found if @stickers.blank?
        end
    
        def sticker_params
          params.require(:sticker).permit(:quantity)
        end
    end
  end
end
