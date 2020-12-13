module Api
	module V1
        class Api::V1::InstituicaosController < ApplicationController   
            # Listar todas as instituiçoes de ensino
            def index
                instituicaos = Instituicao.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Instituições de ensino carregadas', data:instituicaos}, status: :ok
            end
             # Listar instituições passando ID
             def show
                instituicao = Instituicao.find(params[:id])
                render json: {status: 'SUCCESS', message:'Instituição carregada', data:Instituicao}, status: :ok
            end
             # Criar uma nova instituição
             def create 
                instituicao = Instituicao.new(instituicao_params)
                if instituicao.save
                    render json: {status: 'SUCCESS', message:'Saved instituicao', data:instituicao}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Instituicao not saved', data:instituicao.errors}, status: :unprocessable_entity
                end
            end 
            # parametros aceitos
            private
            def instituicao_params
                params.permit(:nome, :cnpj, :tipo)  
            end 
		end
	end
end