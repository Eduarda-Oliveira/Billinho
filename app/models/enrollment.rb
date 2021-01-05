class Enrollment < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  include MoneyRails::ActionViewExtension

  #validates :full_value, presence: true, numericality: { greater_than: 0 }
  validates :installments, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :due_day, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :course, presence: true
  #validate :format
  monetize :amount_cents, numericality: { greater_than: 0 }

  belongs_to :student
  belongs_to :institution

  private

  def format
    full_value = number_to_currency(full_value, unit: "R$")
  end

  def format_money(oi)
    money = Money.new(oi)
    money = money.format
  end
end