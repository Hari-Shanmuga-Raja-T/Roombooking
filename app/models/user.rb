class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  valid_password = /\A
  (?=.*\d)      
  (?=.*[a-z])    
  (?=.*[A-Z])       
  (?=.*[[:^alnum:]])
  /x
  validates :password,
    presence: true, 
    length: { in: Devise.password_length }, 
    format: { with: valid_password }, 
    confirmation: true, 
    on: :create 
  validates :password,
    presence: true, 
    length: { in: Devise.password_length }, 
    format: { with: valid_password }, 
    confirmation: true, 
    on: :update
  validates :firstname,presence: true
  validates :lastname,presence: true
  validates :phno,presence: true,uniqueness: true,length: { in: 6..10 },numericality: { only_integer: true }
  validates :address,presence: true
  validates :mode,presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs, dependent: :destroy
  has_many :access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            foreign_key: :resource_owner_id,
            dependent: :delete_all
end
