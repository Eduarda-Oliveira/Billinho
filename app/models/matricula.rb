class Matricula < ApplicationRecord
  validates :valor_total_reais, presence: true, numericality: { greater_than: 0 }
  validates :quantidade_faturas, presence: true, numericality: { greater_than_or_equal_to: 1 } 
  validates :dia_vencimento_faturas, presence: true, numericality: { greater_than: 0, less_than: 32}
  validates :nome_curso, presence: true
  belongs_to :aluno
  belongs_to :instituicao
  has_many :fatura
end 
