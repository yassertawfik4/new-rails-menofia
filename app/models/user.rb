class User < ApplicationRecord
  validates :name, :dob, :email, :phone, :address, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true
end
