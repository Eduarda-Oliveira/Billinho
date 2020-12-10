module Api
	module V1
        class Api::V1::MatriculasController < ApplicationController   
            include criaFatura
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
             # Criar uma nova matricula (e faturas)
            def create 
                matricula = Matricula.new(matricula_params)
                if matricula.save
                    render json: {status: 'SUCCESS', message:'Saved matricula', data:matricula}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Matricula not saved', data:matricula.errors}, status: :unprocessable_entity
                end
            end
             # parametros aceitos matricula
             private
            def matricula_params
                params.permit(:valor_total_reais, :quantidade_faturas, :dia_vencimento_faturas, :nome_curso, :aluno_id, :instituicao_id) 
            end
            
            def valorFatura
                valor_total_reais/ quantidade_faturas 
            end    
             
            def after_create 
                criaFatura.new(matricula: matricula, matricula.dia_vencimento_faturas, matricula.quantidade_faturas, valorFatura).perform
            end
            
		end
	end
end