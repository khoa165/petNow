class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Associations.
  has_many :pets, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  # Set up image uploader for pet.
  mount_uploader :photo, PhotoUploader

  # Devise features.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_owner?
    is_owner
  end

  def mark_owner
    is_owner = true
  end
end
