class Pet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_many :users, through: :booking
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :species, presence: true
  validates :age, presence: true
end
