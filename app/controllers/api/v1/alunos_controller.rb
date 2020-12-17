module Api
	module V1
        class AlunosController < ApplicationController   
            # Listar todos os alunos
            def index
                alunos = Aluno.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Alunos loaded', data:alunos}, status: :ok
            end
            # Listar alunos passando ID
            def show
                aluno = Aluno.find(params[:id])
                render json: {status: 'SUCCESS', message:'Aluno loaded', data:aluno}, status: :ok
            end
            # Criar um novo aluno
            def create 
                aluno = Aluno.new(aluno_params)
                if aluno.save
                    render json: {status: 'SUCCESS', message:'Saved aluno', data:aluno}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Aluno not saved', data:aluno.errors}, status: :unprocessable_entity
                end
            end 
             # Exclui aluno
			def destroy
				aluno = Aluno.find(params[:id])
				aluno.destroy
				render json: {status: 'SUCCESS', message:'Deleted aluno', data:aluno},status: :ok
            end
            # Atualiza aluno
			def update
				aluno = Aluno.find(params[:id])
				if aluno.update_attributes(aluno_params)
					render json: {status: 'SUCCESS', message:'Updated aluno', data:aluno},status: :ok
				else
					render json: {status: 'ERROR', message:'Aluno not update', data:aluno.errors},status: :unprocessable_entity
				end
			end
            # parametros aceitos
            private
            def aluno_params
                params.permit(:nome, :cpf, :data_nascimento, :telefone_celular, :genero, :meio_pagamento_fatura)  
            end 
        end
	end
end 