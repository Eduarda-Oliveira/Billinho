module Api
	module V1
        class Instituicao_EnsinosController < ApplicationController   
            # Listar todas as instituiçoes de ensino
            def index
                instituicao_ensinos = InstituicaoEnsino.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Instituições de ensino carregadas', data:instituicao_ensinos}, status: :ok
            end
		end
	end
end
