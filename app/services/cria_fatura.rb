class CriaFatura < ApplicationController
    def initialize(params={})
        @matricula = Matricula.find(params[:dia_vencimento_faturas, :valor_total_reais, :quantidade_faturas, matricula_id]
        @fatura = Fatura.find(params[:data_vencimento, :valor_fatura_reais, :status]
    end

    def CreateFatura
        statusDefault
        criaData
        valor
        matricula
    end

    def statusDefault
        status = 'Aberta'
    end

    require 'date'
    data = Date.today
    dia = data.mday
    def mesInicio 
        if dia_vencimento_faturas <= dia
            dia = dia_vencimento_faturas
            data = data << -1
        else
            dia = dia_vencimento_faturas
        end
    end
    mes = data.mon
    ano = data.year
    def criaData
        data_vencimento = Date.new(ano, mes, dia)
    end

    def valor(valor_total_reais, quantidade_faturas)#funciona
        valor_fatura_reais = valor_total_reais/ quantidade_faturas 
    end      

    def matricula
        matricula_id = matricula_id
    end
end