module Api
  module V1
    class ServiceMappingsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_service_mapping, only: [:show, :update, :destroy]

      # GET /service_mappings?service_id=N
      def index
        #@service_mappings = ServiceMapping.all
        @service_mappings = Document.joins(:service_mappings).where("service_id = ?", params[:service_id])

        render json: @service_mappings
      end

      # GET /service_mappings/1
      def show
        render json: @service_mapping
      end

      # POST /service_mappings
      def create
        @service_mapping = ServiceMapping.new(service_mapping_params)

        if @service_mapping.save
          render json: @service_mapping, status: :created, location: @service_mapping
        else
          render json: @service_mapping.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /service_mappings/1
      def update
        if @service_mapping.update(service_mapping_params)
          render json: @service_mapping
        else
          render json: @service_mapping.errors, status: :unprocessable_entity
        end
      end

      # DELETE /service_mappings/1
      def destroy
        @service_mapping.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_service_mapping
          @service_mapping = ServiceMapping.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def service_mapping_params
          params.require(:service_mapping).permit(:document_id, :service_id)
        end
    end
  end
end
