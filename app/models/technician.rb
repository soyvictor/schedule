class Technician < ApplicationRecord
  has_many :work_orders
  validates :name, presence: true
end
