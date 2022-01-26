class User < ApplicationRecord
  has_many :searches

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
