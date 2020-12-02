module Api
	module V1
        class AlunosController < ApplicationController   
            # Listar todos os alunos
            def index
                alunos = Aluno.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Alunos carregados', data:alunos}, status: :ok
            end
		end
	end
end