class Enrollment < ApplicationRecord
  validates :full_value, presence: true, numericality: { greater_than: 0 }
  validates :installments, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :due_day, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :course, presence: true
  # validate :format_money

  belongs_to :student
  belongs_to :institution

  private

  def format_money
    money = Money.new(full_value)
    money = money.format.to_i
  end
end
