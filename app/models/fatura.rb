class Fatura < ApplicationRecord
  validates :valor_fatura_reais, presence: true, verificaFatura()
  validates :data_vencimento, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }, :defaul => 'aberta'
  belongs_to :matricula


  #a soma do valor de todas as faturas de uma determinada matricula deve ser igual ao valor total da matricula

  #o campo quantidade de faturas da matricula deve ser igual a quantidade das faturas associadas aquela matricula

  def matricula
    self.matricula
  end

  def verificaFatura
    return((valor_fatura_reais * matricula.quantidade_faturas) == matricula.valor_total_reais)
  end

end