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
                    createFatura(matricula_params)
                else
                    render json: {status: 'ERROR', message:'Matricula not saved', data:matricula.errors}, status: :unprocessable_entity
                end  
            end
             # parametros aceitos matricula

             private
            
            def matricula_params
                params.permit(:valor_total_reais, :quantidade_faturas, :dia_vencimento_faturas, :nome_curso, :aluno_id, :instituicao_id) 
            end
            
            def valorFatura(matricula_params)
                (matricula_params[:valor_total_reais].to_f/ matricula_params[:quantidade_faturas]).round(2)
            end    

            def fatura
                CriaFatura.new().createFatura
            end

            def fatura_params
                params.permit(:matricula_id, :dia_vencimento, :quantidade_faturas, :valor)
            end

            def statusDefault
                'Aberta'
            end

            def validaData(matricula_params)
                data = Date.today
                dia = data.mday
                return matricula_params[:dia_vencimento_faturas] > dia
            end 

            def dataInicio(matricula_params)
                if validaData(matricula_params)
                    Date.new(Date.today.cwyear,Date.today.mon, matricula_params[:dia_vencimento_faturas] )
                else
                    Date.new(Date.today.cwyear,Date.today.mon, matricula_params[:dia_vencimento_faturas] ).next_month
                end
            end  

            def createFatura(matricula_params)
                quantidade = matricula_params[:quantidade_faturas]
                dataVencimento = dataInicio(matricula_params)
                quantidade.times do 
                    Fatura.create(valor_fatura_reais: valorFatura(matricula_params), data_vencimento: dataVencimento, status: statusDefault, matricula_id: Matricula.last.id)
                    dataVencimento = dataVencimento.next_month
                end
            end

        end
    end
end