class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :total_price, presence: true

  def is_owner?
    is_owner
  end

  def compute_price(price_per_day)
    num_days = start_date == end_date ? 1 : end_date - start_date
    num_days * price_per_day
  end
end
