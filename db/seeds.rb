# This file should ensure the existence of records required to run the application in every environment (production,
# development test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action" "Comedy" "Drama" "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Posting.destroy_all
Profile.destroy_all
User.destroy_all
School.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('profiles')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('schools')
ActiveRecord::Base.connection.reset_pk_sequence!('postings')

User.create(email: "email@gmail.com", password_digest: BCrypt::Password.create('123'))

p "Created #{User.count} User "



School.create([
{ name: "CUNY Hunter College" },
{ name: "Harvard University" },
{ name: "Yale University" },
{ name: "Princeton University" },
{ name: "Columbia University" },
{ name: "Massachusetts Institute of Technology (MIT)" },
{ name: "University of Pennsylvania" },
{ name: "Brown University" },
{ name: "Dartmouth College" },
{ name: "Cornell University" },
{ name: "University of Virginia" },
{ name: "Johns Hopkins University" },
{ name: "Georgetown University" },
{ name: "Boston University" },
{ name: "Boston College" },
{ name: "Northeastern University" },
{ name: "University of North Carolina at Chapel Hill" },
{ name: "University of Maryland" },
{ name: "University of Delaware" },
{ name: "Rutgers University" },
{ name: "Fordham University" },
{ name: "New York University (NYU)" },
{ name: "Williams College" },
{ name: "Amherst College" },
{ name: "Swarthmore College" },
{ name: "Haverford College" },
{ name: "Wellesley College" },
{ name: "Bowdoin College" },
{ name: "Colby College" },
{ name: "Bates College" },
{ name: "Middlebury College" },
{ name: "Wesleyan University" },
{ name: "University of Vermont" },
{ name: "College of William & Mary" },
{ name: "Wake Forest University" },
{ name: "George Washington University" },
{ name: "American University" },
{ name: "Villanova University" },
{ name: "University of Rhode Island" },
{ name: "Tufts University" },
{ name: "Smith College" },
{ name: "Mount Holyoke College" },
{ name: "Vassar College" },
{ name: "Hamilton College" },
{ name: "Skidmore College" },
{ name: "Trinity College" },
{ name: "Bucknell University" },
{ name: "Lafayette College" },
{ name: "Lehigh University" },
{ name: "Union College" },
{ name: "St. Lawrence University" }
])

p "Created #{School.count} college entries."


Profile.create(fname: "Tester", lname: "User", tag: "TUser",  status: true, user_id: 1, school_id: 1)
p "Created #{Profile.count} Profile "


Posting.create([
  { place: "iHOP", description: "Place was a great spot. Breakfast food always hits the spot", rating: 4, location: "34 Street, New York, NY", school_id: 1, profile_id: 1, img: "https://therussofirm.com/wp-content/uploads/2023/09/mcdonalds-meal-the-russo-firm.jpg" },
  { place: "McDonalds", description: "Place has become too expensive. Everything is overpriced and they served me very little. Staff was also rude.", rating: 1, location: "Random Street, Miami, Florida", school_id: 1, profile_id: 1, img: "" },
  { place: "Papa Johns", description: "They do indeed do it better at Papa Johns. I got their Bogo and their pizza was nice and fresh", rating: 4, location: "151 Street, New York, NY", school_id: 1, profile_id: 1, img: ""  }
])

p "Created #{Posting.count} posts"
