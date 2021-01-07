class Institution < ApplicationRecord

    has_many :enrollments
    
    validates :name, presence: true, uniqueness: true
    validates :cnpj, uniqueness: true, format: { with: /\d+/}
    validates :institution_type, presence: true, inclusion: { in: %w[Universidade Escola Creche] }
    validate :valid_cnpj
  
    private
  
    def valid_cnpj
      if CNPJ.valid?(cnpj)
        x = CNPJ.new(cnpj)
        x = x.stripped
        self.cnpj = x
      end
    end
  end
