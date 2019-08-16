class Review < ApplicationRecord
  RATINGS = (0..5).to_a

  # Associations.
  belongs_to :booking
  belongs_to :pet
  belongs_to :user

  # Validations.
  validates :stars, numericality: true, inclusion: {in: RATINGS}
  validates :content, presence: true, length: { in: 10..300 }
end
