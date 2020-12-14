module Api
	module V1
        class Api::V1::MatriculasController < ApplicationController   
            #include criaFatura
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
                    CriaFatura.new( matricula_id: matricula.id, 
                                    dia_vencimento_faturas: matricula.dia_vencimento_faturas, 
                                    valorFatura: valorFatura(matricula_params), 
                                    quantidade_faturas: matricula.quantidade_faturas
                                    ).perform
                else
                    render json: {status: 'ERROR', message:'Matricula not saved', data:matricula.errors}, status: :unprocessable_entity
                end  
            end
             
             private
            # parametros aceitos matricula
            def matricula_params
                params.permit(:valor_total_reais, :quantidade_faturas, :dia_vencimento_faturas, :nome_curso, :aluno_id, :instituicao_id) 
            end
            #valor da fatura com duas casas após a virgula
            def valorFatura(matricula_params)
                (matricula_params[:valor_total_reais].to_f/ matricula_params[:quantidade_faturas]).round(2)
            end    


        end
    end
end