class WorkOrdersController < ApplicationController
  def index
    @technicians = Technician.all
    @work_orders_date = WorkOrder.first.time.strftime("%A, %B %-d, %Y")
  end
end
