class Pet < ApplicationRecord
  CATEGORIES = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]

  # Associations.
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  has_many :reviews, through: :booking

  # Validations
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :species, presence: true
  validates :age, presence: true
  validates :address, presence: true
end
