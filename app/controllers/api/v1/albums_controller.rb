# frozen_string_literal: true

module API
  module V1
    class AlbumsController < ApplicationController
      before_action :load_albums, only: %i[index]
      before_action :load_album, only: %i[show update]

      def index
        render json: @albums, status: :ok
      end

      def show
        render json: @album, status: :ok
      end

      def create
        @album = Album.new(album_params)

        if @album.save
          render json: @album, status: :created
        else
          render json: @album.errors, status: :unprocessable_entity
        end
      end

      def update
        if @album.update(album_params)
          render json: @album
        else
          render json: @album.errors, status: :unprocessable_entity
        end
      end

      private

      def load_album
        @album = Album.by_uuid(params[:id])&.first

        return head :not_found if @album.blank?
      end

      def album_params
        params.require(:album).permit(:name, :description, :number_of_stickers)
      end

      def load_albums
        @albums = Album.all

        return head :not_found if @albums.empty?
      end
    end
  end
end
