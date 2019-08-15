class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  def compute_price(price_per_day)
    num_days = start_date == end_date ? 1 : (end_date - start_date).to_i
    num_days * price_per_day
  end
end
