class AddEndTimeToWorkOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :end_time, :time
  end
end
