class Hotel < ApplicationRecord

  validates :hotelname,presence: true
  validates :email,presence: true
  validates :phno,presence: true,uniqueness: true,length: { in: 6..10 },numericality: { only_integer: true }
  validates :address,presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms , dependent: :destroy
  has_many :logs , through: :rooms
  has_many :bookings, dependent: :destroy
  has_one :discount, dependent: :destroy
  
end
