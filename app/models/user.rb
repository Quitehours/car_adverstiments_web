class User < ApplicationRecord
  has_many :searches, dependent: :destroy
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable, :rememberable
end
