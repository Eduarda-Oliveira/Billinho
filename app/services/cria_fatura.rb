class CriaFatura 
    #indica as variaveis utilizadas, ele é para o acesso
    attr_accessor :matricula, :dia_vencimento, :valor, :quantidade, :fatura

    #prepara os atributos da classe
    def initialize(params={})
        @matricula = Matricula.find(params[:matricula_id])
        @dia_vencimento = params[:dia_vencimento_faturas]
        @valor = params[:valorFatura]
        @quantidade = params[:quantidade_faturas]
    end

    def perform
        createFatura
    end

    private

    def statusDefault
        'Aberta'
    end

    #Verifica se o dia de vencimento é maior que o dia de hoje
    def validaData
        data = Date.today
        dia = data.mday
        return dia_vencimento > dia
    end 

    #diz se as faturas começam no mes atual ou no seguinte
    def dataInicio
        if validaData
            Date.new(Date.today.cwyear,Date.today.mon, dia_vencimento)
        else
            Date.new(Date.today.cwyear,Date.today.mon, dia_vencimento).next_month
        end
    end  
 
    def createFatura
        dataVencimento = dataInicio
        quantidade.times do 
            Fatura.create(valor_fatura_reais: valor, data_vencimento: dataVencimento, status: statusDefault, matricula: matricula)
            dataVencimento = dataVencimento.next_month
        end
    end

end