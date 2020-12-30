module Api
  module V1
    class Api::V1::InstitutionsController < ApplicationController
      # Listar todas as instituiçoes de ensino
      def index
        institutions = Institution.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Institutions de ensino loaded', data: institutions },
               status: :ok
      end

      # Listar institutions passando ID
      def show
        institution = Institution.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Institution loaded', data: institution }, status: :ok
      end

      # Criar uma nova institution
      def create
        institution = Institution.new(institution_params)
        if institution.save
          render json: { status: 'SUCCESS', message: 'Saved institution', data: institution }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Institution not saved', data: institution.errors },
                 status: :unprocessable_entity
        end
      end

      # Exclui institution
      def destroy
        institution = Institution.find(params[:id])
        institution.destroy
        render json: { status: 'SUCCESS', message: 'Deleted institution', data: institution }, status: :ok
      end

      # Atualiza institution
      def update
        institution = Institution.find(params[:id])
        if institution.update_attributes(institution_params)
          render json: { status: 'SUCCESS', message: 'Updated institution', data: institution }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Institution not update', data: institution.errors },
                 status: :unprocessable_entity
        end
      end
      # parametros aceitos

      private

      def institution_params
        params.permit(:name, :cnpj, :institution_type)
      end
    end
  end
end
