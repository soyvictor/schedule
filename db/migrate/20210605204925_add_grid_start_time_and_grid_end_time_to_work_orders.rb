class AddGridStartTimeAndGridEndTimeToWorkOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :grid_start_time, :string
    add_column :work_orders, :grid_end_time, :string
  end
end
