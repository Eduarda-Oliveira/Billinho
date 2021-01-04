class Bill < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }
  belongs_to :enrollment
end
