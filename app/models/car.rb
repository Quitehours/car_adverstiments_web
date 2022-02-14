class Car < ApplicationRecord
  validates :make, :model, :price, :year, :odometer, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :year, numericality: { greater_than: 0 }
  validates :odometer, numericality: { greater_than: 0 }
end
