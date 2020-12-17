class Fatura < ApplicationRecord
  validates :valor_fatura_reais, presence: true, numericality: { greater_than: 0 }
  validates :data_vencimento, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }
  belongs_to :matricula
  
end