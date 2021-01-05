class Bill < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  include MoneyRails::ActionViewExtension
  #validates :value, presence: true #numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }
  belongs_to :enrollment

  monetize :amount_cents, numericality: { greater_than: 0 }

 # validate :format

  private 

  def format
    value = number_to_currency(value, unit: "R$")
  end
end
