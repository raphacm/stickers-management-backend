module API
  module V1
    class CollectionsController < ApplicationController
      before_action :load_collector, only: %i[index show, create destroy]
      before_action :load_album, only: %i[create]
      before_action :load_collections, only: %i[index]
      before_action :load_collection, only: %i[show destroy]

      def index   
        render json: @collections, status: :ok
      end
    
      def show
        render json: @collection
      end
    
      def create
        @collection = Collection.new(build_collection_params)
    
        if @collection.save
          render json: @collection, status: :created
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        if @collection.destroy
          head :no_content
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end
    
      private
      def load_collector
        @collector = Collector.by_uuid(params[:collector_id])&.first
        
        return head :not_found if @collector.blank?
      end
      
      def load_collections
        @collections = Collection.by_collector(@collector)

        return head :not_found if @collections.empty?
      end

      def load_collection
        @collection = Collection.by_uuid(params[:id])&.first
        return head :not_found if @collection.blank?
      end

      def load_album 
        @album = Album.by_uuid(params[:album_id])&.first
        return head :not_found if @album.blank?
      end

      def build_collection_params
        { collector: @collector, album: @album }
      end
    
    end
  end
end

