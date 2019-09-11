module API
  module V1    
    class StickersController < ApplicationController
      before_action :set_sticker, only: [:show, :update, :destroy]
    
      def index
        @stickers = Sticker.all
    
        render json: @stickers
      end
    
      def show
        render json: @sticker
      end
    
      def create
        @sticker = Sticker.new(sticker_params)
    
        if @sticker.save
          render json: @sticker, status: :created, location: @sticker
        else
          render json: @sticker.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @sticker.update(sticker_params)
          render json: @sticker
        else
          render json: @sticker.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @sticker.destroy
      end
    
      private
        def set_sticker
          @sticker = Sticker.find(params[:id])
        end
    
        def sticker_params
          params.require(:sticker).permit(:uuid, :collection_id, :number, :quantity)
        end
    end
  end
end
