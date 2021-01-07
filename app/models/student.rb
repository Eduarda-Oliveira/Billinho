class Student < ApplicationRecord
  
    has_many :enrollments

    validates :name, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, format: { with: /\d+/}
    validates :gender, presence: true, inclusion: { in: %w[F M] }
    validates :payment_method, presence: true, inclusion: { in: %w[Boleto Cartão] }
    validate :valid_cpf
  
    private
  
    def valid_cpf
      if CPF.valid?(cpf)
        x = CPF.new(cpf)
        x = x.stripped
        self.cpf = x
      end
    end
  end
  
  