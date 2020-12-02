class Matricula < ApplicationRecord
  validates :valor_total_reais, presence: true, numericality: { greater_than: 0 } #falta formatar o float
  validates :quantidade_faturas, presence: true, numericality: { greater_than_or_equal_to: 1 } 
  validates :dia_vencimento_faturas, presence: true, numericality: { greater_than: 0, less_than: 32}
  validates :nome_curso, presence: true
  belongs_to :aluno
  belongs_to :instituicao_ensino
  def valorFatura(valor_total_reais, quantidade_faturas)
    return valor_total_reais / quantidade_faturas
  end

  def faturas
    self.fatura
  end

#  def verificaFatura(fatura.valor_fatura_reais, valor_total_reais, quantidade_faturas)
 #   return((fatura.valor_fatura_reais * quantidade_faturas) == valor_total_reais)
    
 # end

  #def 
  #  Matricula.faturas.cont

end