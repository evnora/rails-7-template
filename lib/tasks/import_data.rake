# lib/tasks/import_data.rake
 require "csv"

 namespace :import do
   desc "Import students from roster.csv"
   task students: :environment do
     CSV.foreach("roster.csv", headers: true) do |row|
       the_student                 = Student.new
       the_student.name            = row.fetch("Name")
       the_student.enrollments_count = 0
       the_student.save
     end
     puts "Imported #{Student.count} students"
   end

   desc "Import behaviors from behaviors.csv"
   task behaviors: :environment do
     CSV.foreach("behaviors.csv", headers: true) do |row|
       the_behavior                = Behavior.new
       the_behavior.name           = row.fetch("Name")
       the_behavior.incidents_count = 0
       the_behavior.save
     end
     puts "Imported #{Behavior.count} behaviors"
   end
 end
