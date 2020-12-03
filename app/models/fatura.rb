class Fatura < ApplicationRecord
  validates :valor_fatura_reais, presence: true
  validates :data_vencimento, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) } #falta "sendo o valor default aberta"
  belongs_to :matricula
end