class User < ApplicationRecord
  has_secure_password
  has_one :employee, dependent: :destroy
  has_many :registrations
  has_many :events, through: :registrations
  validates :name, :email, :contact, :password, presence: true
end