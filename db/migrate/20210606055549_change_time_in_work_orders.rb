class ChangeTimeInWorkOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :work_orders, :time
  end
end
