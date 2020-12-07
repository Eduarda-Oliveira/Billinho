module Api
	module V1
        class Api::V1::MatriculasController < ApplicationController   
            # Listar todas as matriculas
            def index
                matriculas = Matricula.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Matriculas carregadas', data:matriculas}, status: :ok
            end
            # Listar matriculas passando ID
            def show
                matricula = Matricula.find(params[:id])
                render json: {status: 'SUCCESS', message:'Matricula carregada', data:matricula}, status: :ok
            end
             # Criar uma nova matricula (e valor faturas)
            def create 
                matricula = Matricula.new(matricula_params)
                if matricula.save
                    render json: {status: 'SUCCESS', message:'Saved matricula', data:matricula}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Matricula not saved', data:matricula.errors}, status: :unprocessable_entity
                end
                #matricula.quantidade_faturas.times do
                   
               # end
            end
            # parametros aceitos matricula
            private
            def matricula_params
                params.permit(:valor_total_reais, :quantidade_faturas, :dia_vencimento_faturas, :nome_curso, :aluno_id, :instituicao_id) 
            end 
             # parametros aceitos matricula
            private
            def fatura_params
                params.permit(:status, :matricula_id)
            end
		end
	end
end