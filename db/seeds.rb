# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
puts 'Destroying Location Records'
Location.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('locations')

filepath = 'csv_files/locations.csv'

CSV.foreach(filepath, headers: :first_row) do |row|
  new_location = Location.new
  new_location.id = row["id"]
  new_location.name = row["name"]
  new_location.city = row["city"]
  new_location.save!
end


