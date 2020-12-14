class VerificaFatura < Fatura
    def matricula
        self.matricula
    end
    
    def fatura
      return((valor_fatura_reais * matricula.quantidade_faturas) == matricula.valor_total_reais)
    end
end