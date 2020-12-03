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
		end
	end
end