class CreateWorkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_orders do |t|
      t.string :start_time
      t.integer :duration
      t.integer :price
      t.references :location, null: false, foreign_key: true
      t.references :technician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
