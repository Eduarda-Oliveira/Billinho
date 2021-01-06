class Enrollment < ApplicationRecord

  has_many :bills

  validates :installments, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :due_day, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :course, presence: true
  
  monetize :amount_cents, numericality: { greater_than: 0 }

  belongs_to :student
  belongs_to :institution

end