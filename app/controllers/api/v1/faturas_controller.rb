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
            #cria fatura
            def create
                fatura =  CriaFatura.new(fatura_params).perform
                if fatura.save
                    render json: {status: 'SUCCESS', message:'Saved fatura', data:fatura}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Fatura not saved', data:fatura.errors}, status: :unprocessable_entity
                end
            end
            # Exclui fatura
			def destroy
				fatura = Fatura.find(params[:id])
				fatura.destroy
				render json: {status: 'SUCCESS', message:'Deleted fatura', data:fatura},status: :ok
            end
            # Atualiza fatura
			def update
				fatura = Fatura.find(params[:id])
				if fatura.update_attributes(fatura_params)
					render json: {status: 'SUCCESS', message:'Updated fatura', data:fatura},status: :ok
				else
					render json: {status: 'ERROR', message:'Fatura not update', data:fatura.errors},status: :unprocessable_entity
				end
			end
            private
            def fatura_params
                params.permit(:valor_fatura_reais, :data_vencimento, :status, :matricula_id)
            end
		end
	end
end