require 'sequel'

    database_test ||= Sequel.postgres('task_manager_test')
    database_dev ||= Sequel.postgres('task_manager_dev')

[database_test, database_dev].each do |database|
  database.create_table :tasks do
    primary_key :id
    String :title
    Text :description
  end
end

# migrations alter state of database, not creating it
# createdb command creates the database
# data normalization - break apart and compartmentalize
