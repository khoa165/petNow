class Review < ApplicationRecord
  belongs_to :booking
  validates :stars, numericality: { less_than_or_equal_to: 5, only_integer: true }
  validates :content, presence: true, length: { minimum: 50 }
end