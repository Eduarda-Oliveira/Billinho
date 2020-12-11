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
                else
                    render json: {status: 'ERROR', message:'Matricula not saved', data:matricula.errors}, status: :unprocessable_entity
                end
            end
             # parametros aceitos matricula
             after_action:fatura

             def fatura
                fatura = createFatura.new(fatura_params).perform
            end
             private
            def matricula_params
                params.permit(:valor_total_reais, :quantidade_faturas, :dia_vencimento_faturas, :nome_curso, :aluno_id, :instituicao_id) 
            end
            
            def valorFatura
                valor_total_reais/ quantidade_faturas 
            end    


            def fatura_params
                params.permit(matricula :matricula, matricula.dia_vencimento_faturas, matricula.quantidade_faturas, valorFatura) 
            end


            #prepara os atricutos da classe
            def initialize(params={})
                @matricula = params[:matricula]
                @dia_vencimento = params[:dia_vencimento_faturas]
                @valor = params[:valorFatura]
                @quantidade = params[:quantidade_faturas]
            end

            def perform
                createFatura
            end

            def statusDefault
                'Aberta'
            end

            def validaData
                data = Date.today
                dia = data.mday
                return dia_vencimento > dia
            end 

            def dataInicio
                if validaData
                    Date.new(Date.today.cwyear,Date.today.mon, dia_vencimento)
                else
                    Date.new(Date.today.cwyear,Date.today.mon, dia_vencimento).next_month
                end
            end  

            def createFatura
                #@quantidade.times do 
                matricula.faturas.create(valor_fatura_reais: valor, data_vencimento: dataInicio, status: statusDefault, matricula_id: matricula)
                #end
            end
		end
	end
end