class ChangeEndTimeInWorkOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :work_orders, :end_time, :time
    add_column :work_orders, :end_time, :datetime
  end
end
