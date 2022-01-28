class User < ApplicationRecord
  has_many :searches, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable
end
