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
            def create
               fatura = criaFatura(params[:dia_vencimento_faturas, :valor_fatura_reais, :data_vencimento, :status, :matricula_id, :valor_total_reais, :quantidade_faturas]).createFatura
                data = data << -1
            end
            private
            def fatura_params
                params.permit(:valor_fatura_reais, :data_vencimento, :status, :matricula_id)
            end
		end
	end
end