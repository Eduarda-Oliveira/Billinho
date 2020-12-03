module Api
	module V1
        class FaturasController < ApplicationController   
            # Listar todas as faturas
            def index
                faturas = Fatura.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Faturas carregadas', data:faturas}, status: :ok
            end
             # Listar faturas passando ID
             def show
                fatura = Fatura.find(params[:id])
                render json: {status: 'SUCCESS', message:'Fatura carregada', data:fatura}, status: :ok
            end
		end
	end
end