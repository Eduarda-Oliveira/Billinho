class Aluno < ApplicationRecord
    validates :nome, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :genero, presence: true, inclusion: { in: %w(F M) }
    validates :meio_pagamento_fatura, presence: true, inclusion: { in: %w(Boleto Cartão) }
end
 