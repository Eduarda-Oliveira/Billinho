module Api
	module V1
        class FaturasController < ApplicationController   
            # Listar todas as faturas
            def index
                faturas = Fatura.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'faturas carregadas', data:faturas}, status: :ok
            end
		end
	end
end