class Fatura < ApplicationRecord
   #include ActiveModel::Validations
  validates :valor_fatura_reais, {type: true}
  validates :valor_fatura_reais, presence: true
  validates :data_vencimento, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }
  belongs_to :matricula
  
end 