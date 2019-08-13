class Pet < ApplicationRecord
  CATEGORIES = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_many :users, through: :booking
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :species, presence: true
  validates :age, presence: true
end
