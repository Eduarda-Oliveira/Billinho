class InstituicaoEnsino < ApplicationRecord
    validates :nome, presence: true, uniqueness: true/
    validates :cnpj, uniqueness: true numericality: { only_integer: true }
    validates :tipo, presence: true, inclusion: { in: %w(Universidade Escola Creche) }
end
