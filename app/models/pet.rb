class Pet < ApplicationRecord
    # Constant.
  CATEGORIES = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]

  # Associations.
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  has_many :reviews, dependent: :destroy


  # Set up image uploader for pet.
  mount_uploader :photo, PhotoUploader
  #Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Validations
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :species, presence: true
  validates :age, presence: true
end
