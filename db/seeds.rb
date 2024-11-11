# This file should ensure the existence of records required to run the application in every environment (production,
# development
test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action" "Comedy" "Drama" "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

School.destroy_all

School.create(school: "Harvard University")
School.create(school: "Yale University") 
School.create(school: "Princeton University")School.create(school: "Columbia University")
School.create(school: "Massachusetts Institute of Technology (MIT)")
School.create(school: "University of Pennsylvania")
School.create(school: "Brown University")
School.create(school: "Dartmouth College")
School.create(school: "Cornell University")
School.create(school: "University of Virginia")
School.create(school: "Johns Hopkins University")
School.create(school: "Georgetown University")
School.create(school: "Boston University")
School.create(school: "Boston College")
School.create(school: "Northeastern University")
School.create(school: "University of North Carolina at Chapel Hill")
School.create(school: "University of Maryland")
School.create(school: "University of Delaware")
School.create(school: "Rutgers University")
School.create(school: "Fordham University")
School.create(school: "New York University (NYU)")
School.create(school: "Williams College")
School.create(school: "Amherst College")
School.create(school: "Swarthmore College")
School.create(school: "Haverford College")
