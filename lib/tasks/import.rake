namespace :import do
  desc "Import locations, technicians, and work orders from csv"
  task csv_files: :environment do
    puts 'Destroying location, technician, work order database records'
    WorkOrder.destroy_all
    Technician.destroy_all
    Location.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('locations')
    ActiveRecord::Base.connection.reset_pk_sequence!('technicians')
    ActiveRecord::Base.connection.reset_pk_sequence!('work_orders')

    locations_filepath = 'csv_files/locations.csv'
    technicians_filepath = 'csv_files/technicians.csv'
    work_orders_filepath = 'csv_files/work_orders.csv'

    puts 'Creating new location, technician, and work order database records'

    CSV.foreach(locations_filepath, headers: :first_row) do |row|
      new_location = Location.create(name: row["name"], city: row["city"])
    end

    CSV.foreach(technicians_filepath, headers: :first_row) do |row|
      new_technician = Technician.create(name: row["name"])
    end

    CSV.foreach(work_orders_filepath, headers: :first_row) do |row|
      new_work_order = WorkOrder.new
      new_work_order.technician_id = row["technician_id"].to_i
      new_work_order.location_id = row["location_id"].to_i
      new_work_order.time = DateTime.strptime(row["time"], "%m/%d/%y %k:%M")
      new_work_order.duration = row["duration"]
      new_work_order.end_time = new_work_order.time + (new_work_order.duration * 60)
      new_work_order.price = row["price"].to_i
      new_work_order.save
    end
    puts 'Finished successfully!'
  end
end
