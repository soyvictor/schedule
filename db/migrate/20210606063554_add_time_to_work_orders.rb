class AddTimeToWorkOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :time, :datetime
  end
end
