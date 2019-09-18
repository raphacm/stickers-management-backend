# frozen_string_literal: true

module API
  module V1
    class CollectorsController < ApplicationController
      before_action :load_collector, only: %i[show destroy]

      def show
        render json: @collector, status: :ok
      end

      def create
        @collector = Collector.new(collector_params)

        if @collector.save
          render json: @collector, status: :created
        else
          render json: @collector.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @collector.destroy
          head :no_content
        else
          render json: @collector.errors, status: :unprocessable_entity
        end
      end

      private

      def load_collector
        @collector = Collector.by_uuid(params[:id])&.first

        return head :not_found if @collector.blank?
      end

      def collector_params
        params.require(:collector).permit(:name, :email)
      end
    end
  end
end
