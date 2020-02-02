class User < ApplicationRecord
  has_many :user_shifts

  validates :email_address, uniqueness: true
end
