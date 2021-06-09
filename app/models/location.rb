class Location < ApplicationRecord
  has_many :work_orders
  validates :name, presence: true
  validates :city, presence: true
end
