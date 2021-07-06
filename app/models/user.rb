class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
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
  #   confirmation: true
  validates :firstname,presence: true
  validates :lastname,presence: true
  validates :phno,presence: true,uniqueness: true,length: { in: 6..10 },numericality: { only_integer: true }
  validates :address,presence: true
  validate :test
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs, dependent: :destroy
  has_many :access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            foreign_key: :resource_owner_id,
            dependent: :delete_all
  has_many :access_grants,
            class_name: 'Doorkeeper::AccessGrant',
            foreign_key: :resource_owner_id,
            dependent: :delete_all
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def test
    puts "===========#{self.errors.full_messages}"
    puts "===========#{self.password}"
  end
end
