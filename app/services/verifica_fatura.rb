class VerificaFatura < ApplicationController
    def matricula
        self.matricula
      end
    
      def verificaFatura
        return((valor_fatura_reais * matricula.quantidade_faturas) == matricula.valor_total_reais)
      end
end