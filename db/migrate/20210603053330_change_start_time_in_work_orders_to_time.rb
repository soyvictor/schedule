class ChangeStartTimeInWorkOrdersToTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :work_orders, :start_time, :time
  end
end
