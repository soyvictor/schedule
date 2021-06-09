
This app runs on ruby version 3.0.1 and rails version 6.1.3.2.

Steps to run:

1. Run 'bundle install' to install gems.
2. Run 'yarn install' to install javascript libraries.  This project includes sweetalert2 and momentjs. 
3. Create your database by running 'rails db:create'
4. Run migrations with 'rails db:migrate'
5. Rake task: to import the included locations.csv, technicians.csv, and work_orders.csv files, run 'rake import:csv_files'
6. If you'd like to replace these files with other ones, add them to the csv_files folder that is inside the root project folder and run 'rake import:csv_files'
