class Student < ApplicationRecord
  require 'cpf_cnpj'

  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: %w[F M] }
  validates :payment_method, presence: true, inclusion: { in: %w[Boleto Cartão] }
  validate :validCpf

  private

  def validCpf
    if CPF.valid?(cpf)
      cpf = CPF.new(self.cpf)
      cpf = cpf.formatted
      self.cpf = cpf
    end
  end
end
