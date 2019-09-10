module Api
  module V1
    class DocumentFormsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_document_form, only: [:show, :update, :destroy]

      # GET /document_forms
      def index
        @document_forms = DocumentForm.all

        render json: @document_forms
      end

      # GET /document_forms/1
      def show
        render json: @document_form
      end

      # POST /document_forms
      def create
        @document_form = DocumentForm.new(document_form_params)

        if @document_form.save
          render json: @document_form, status: :created, location: @document_form
        else
          render json: @document_form.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /document_forms/1
      def update
        if @document_form.update(document_form_params)
          render json: @document_form
        else
          render json: @document_form.errors, status: :unprocessable_entity
        end
      end

      # DELETE /document_forms/1
      def destroy
        @document_form.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_document_form
        @document_form = DocumentForm.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def document_form_params
        params.require(:document_form).permit(:name)
      end
    end
  end
end
