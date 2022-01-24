class Car < ApplicationRecord
  validates :make, :model, presence: true
  validates :price, numericality: { greater_than: 0, presence: true }
  validates :year, numericality: { greater_than: 0, presence: true }
  validates :odometer, numericality: { greater_than: 0, presence: true }
end
