class CriaFatura < ApplicationController
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
        criaData
    end

    def statusDefault
        'Aberta'
    end

    def validaData
        data = Date.today
        dia = data.mday
        return dia_vencimento <= dia
    end 

    def mesInicio 
        if validaData
            dia = dia_vencimento
            data = data << -1
        else
            dia = dia_vencimento
        end
        mes = data.mon
        ano = data.year
    end

    def criaInicio
        data_vencimento = Date.new(ano, mes, dia)
    end  
end