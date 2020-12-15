class VerificaFatura < ActiveModel::EachValidator
 
    def validate_each(record, attribute, valor_fatura_reais, quantidade_faturas, valor_total_reais)
      unless ((valor_fatura_reais * quantidade_faturas) != valor_total_reais)
        record.errors.add(attribute, "Não condiz com o valor total")
      end
    end
 end
  
  
 