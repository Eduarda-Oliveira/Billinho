class CriaFatura 
    #indica as variaveis utilizadas, ele é para o acesso
    attr_accessor :matricula, :dia_vencimento, :valor, :quantidade, :fatura

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

    private

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
        quantidade.times do 
            @matricula.faturas.create(valor_fatura_reais: valor, data_vencimento: dataInicio, status: statusDefault, matricula: matricula)
        end
    end

end