class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :valid_end_date

  def compute_price(price_per_day)
    num_days = start_date == end_date ? 1 : (end_date - start_date).to_i
    num_days * price_per_day
  end

  private

  def valid_end_date
    if end_date <= start_date
      errors.add(:end_date, "End date must be after start date")
    end
  end
end
