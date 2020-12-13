class CriaFatura 
    #indica as variaveis utilizadas, ele é para o acesso
    attr_accessor :matricula, :dia_vencimento, :valor, :quantidade, :fatura

    #prepara os atricutos da classe
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
        dataVencimento = dataInicio
        quantidade.times do 
            Fatura.create(valor_fatura_reais: valor, data_vencimento: dataVencimento, status: statusDefault, matricula: matricula)
            dataVencimento = dataVencimento.next_month
        end
    end

end