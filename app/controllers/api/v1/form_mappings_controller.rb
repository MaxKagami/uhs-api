module Api
  module V1
    class FormMappingsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_form_mapping, only: [:show, :update, :destroy]

      # GET /form_mappings?document_form_id=N
      def index
        @form_mappings = Document.joins(:form_mappings).where("document_form_id = ?", params[:document_form_id])
        render json: @form_mappings
      end

      # GET /form_mappings/1
      def show
        render json: @form_mapping
      end

      # POST /form_mappings
      def create
        @form_mapping = FormMapping.new(form_mapping_params)

        if @form_mapping.save
          render json: @form_mapping, status: :created, location: @form_mapping
        else
          render json: @form_mapping.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /form_mappings/1
      def update
        if @form_mapping.update(form_mapping_params)
          render json: @form_mapping
        else
          render json: @form_mapping.errors, status: :unprocessable_entity
        end
      end

      # DELETE /form_mappings/1
      def destroy
        @form_mapping.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_form_mapping
        @form_mapping = FormMapping.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_mapping_params
        params.require(:form_mapping).permit(:form_id, :document_id)
      end
    end
  end
end
