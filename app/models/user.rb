class User < ApplicationRecord
  has_many :user_shifts

  validate :first_name, :last_name
  validates :email_address, uniqueness: true
end
