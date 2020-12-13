class VerificaFatura < ApplicationController
    def matricula
        self.matricula
      end
    
      def Fatura
        return((valor_fatura_reais * matricula.quantidade_faturas) == matricula.valor_total_reais)
      end
end