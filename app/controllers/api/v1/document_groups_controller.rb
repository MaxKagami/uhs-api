module Api
  module V1
    class DocumentGroupsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_document_group, only: [:show, :update, :destroy]

      # GET /document_groups
      def index
        @document_groups = DocumentGroup.all

        render json: @document_groups
      end

      # GET /document_groups/1
      def show
        render json: @document_group
      end

      # POST /document_groups
      def create
        @document_group = DocumentGroup.new(document_group_params)

        if @document_group.save
          render json: @document_group, status: :created, location: @document_group
        else
          render json: @document_group.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /document_groups/1
      def update
        if @document_group.update(document_group_params)
          render json: @document_group
        else
          render json: @document_group.errors, status: :unprocessable_entity
        end
      end

      # DELETE /document_groups/1
      def destroy
        @document_group.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_document_group
          @document_group = DocumentGroup.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def document_group_params
          params.require(:document_group).permit(:name)
        end
    end
  end
end