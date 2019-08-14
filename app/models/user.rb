class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Associations.
  has_many :pets, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # Devise features.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
