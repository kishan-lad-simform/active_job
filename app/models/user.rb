class User < ApplicationRecord
  after_create :send_welcome_email  

  has_secure_password
  has_one :employee, dependent: :destroy
  has_many :registrations
  has_many :events, through: :registrations
  validates :name, :email, :contact, :password, presence: true

  def send_welcome_email
    SendMailJob.perform_now(self.id)
    SendEmployeeMailJob.set(wait: 2.minutes).perform_later(self.id) 
  end
end