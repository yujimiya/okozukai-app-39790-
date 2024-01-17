class Event < ApplicationRecord
  validates :unit_price, :help_date, :help_count, :goal_price, presence: true
  validates :unit_price, numericality:{
    only_integer: true,
    greater_than_or_equal_to: 30,
    less_than_or_equal_to: 1_000,
    message: 'Please enter a valid price between 30 and 1,000'
  }
  validates :goal_price, numericality:{ 
    only_integer: true}
  belongs_to :user
end
