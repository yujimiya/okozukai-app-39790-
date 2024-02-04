class Event < ApplicationRecord
  def start_time
    help_date
  end

  belongs_to :user
end
