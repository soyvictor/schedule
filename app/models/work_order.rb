class WorkOrder < ApplicationRecord
  belongs_to :location
  belongs_to :technician
  before_save :add_grid_times
  validates :duration, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :technician, presence: true
  validates :time, presence: true

  private

  def add_grid_times
    self.grid_start_time = self.time.strftime("%H:%M").gsub(/:/, "")
    self.grid_end_time = self.end_time.strftime("%H:%M").gsub(/:/, "")
  end
end
