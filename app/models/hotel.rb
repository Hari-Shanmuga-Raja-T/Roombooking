class Hotel < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # valid_password = /\A
  # (?=.*\d)      
  # (?=.*[a-z])    
  # (?=.*[A-Z])       
  # (?=.*[[:^alnum:]])
  # /x
  # validates :password,
  #   presence: true, 
  #   length: { in: Devise.password_length }, 
  #   format: { with: valid_password }, 
  #   confirmation: true, 
  validates :hotelname,presence: true
  validates :email,presence: true
  validates :phno,presence: true,uniqueness: true,length: { in: 6..10 },numericality: { only_integer: true }
  validates :address,presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms , dependent: :destroy
  has_many :logs, dependent: :destroy
end
