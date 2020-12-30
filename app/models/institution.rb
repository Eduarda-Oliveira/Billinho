class Institution < ApplicationRecord
  require 'cpf_cnpj'

  validates :name, presence: true, uniqueness: true
  validates :cnpj, uniqueness: true, numericality: { only_integer: true }
  validates :institution_type, presence: true, inclusion: { in: %w[Universidade Escola Creche] }
  validate :valid_cnpj

  private

  def valid_cnpj
    if CNPJ.valid?(cnpj)
      cnpj = CNPJ.new(self.cnpj)
      cnpj = cnpj.formatted
      self.cnpj = cnpj
    end
  end
end
