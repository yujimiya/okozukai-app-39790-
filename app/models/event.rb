class Event < ApplicationRecord
  attr_accessor :virtual_unit_price
  before_save :set_actual_unit_price, unless: :persisted?

  validates :unit_price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 30,
    less_than_or_equal_to: 1_000,
    message: 'Please enter a valid price between 30 and 1,000'
  }

  belongs_to :user

  private
  def set_actual_unit_price
    self.total_price = 0 unless has_attribute?(:total_price)
    self.total_price += virtual_unit_price.to_i
  end
end
