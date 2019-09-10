module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_document, only: [:show, :update, :destroy]

      # GET /documents?document_group_id=N
      def index
        @documents = Document.where("document_group_id = ?", params[:document_group_id])
        render json: @documents
      end

      # GET /documents/1
      def show
        render json: @document
      end

      # POST /documents
      def create
        @document = Document.new(document_params)

        if @document.save
          render json: @document, status: :created, location: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /documents/1
      def update
        if @document.update(document_params)
          render json: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # DELETE /documents/1
      def destroy
        @document.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_document
          @document = Document.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def document_params
          params.require(:document).permit(:name, :url, :document_group_id)
        end
    end
  end
end
