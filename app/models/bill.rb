class Bill < ApplicationRecord

  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }

  monetize :amount_cents, numericality: { greater_than: 0 }

  belongs_to :enrollment

end
