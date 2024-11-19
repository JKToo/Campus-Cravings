# This file should ensure the existence of records required to run the application in every environment (production,
# development test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action" "Comedy" "Drama" "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
 require "uri"
 require "net/http"
def apiImgHelper
  url = URI.parse("https://foodish-api.com/api/")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = http.request(request)

  data = JSON.parse(response.body)

  @imgData = data["image"]
end

Order.destroy_all
Posting.destroy_all
Profile.destroy_all
User.destroy_all
School.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('profiles')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('schools')
ActiveRecord::Base.connection.reset_pk_sequence!('postings')
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
ActiveStorage::Attachment.delete_all
ActiveStorage::Blob.delete_all

userArr = {}

(1..6).each do |i|
userArr[i] = User.create(email: "email#{i}@gmail.com", password_digest: BCrypt::Password.create('123'))
  # userArr[1] = User.create(email: "email1@gmail.com", password_digest: BCrypt::Password.create('123'))
end

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

profileArr={}
(1..6).each do |i|
  profileArr[i] = Profile.create!(fname: "#{Faker::Name.first_name}", lname: "#{Faker::Name.last_name}", tag: "#{Faker::Superhero.name}",  status: true, user_id: i, school_id: 37, avatar: Faker::Avatar.image)
end
p "Created #{Profile.count} Profile "




5.times do |i|
  Posting.create(
  place: Faker::Restaurant.name, description: Faker::Restaurant.review, rating: rand(0...5), location: Faker::Address.full_address, school_id: 37, profile_id: i, img: apiImgHelper)
  Posting.create(
  place: Faker::Restaurant.name, description: Faker::Restaurant.review, rating: rand(0...5), location: Faker::Address.full_address, school_id: 37, profile_id: i, img: apiImgHelper)
  Posting.create(
  place: Faker::Restaurant.name, description: Faker::Restaurant.review, rating: rand(0...5), location: Faker::Address.full_address, school_id: 37, profile_id: i, img: apiImgHelper)
  Posting.create(
  place: Faker::Restaurant.name, description: Faker::Restaurant.review, rating: rand(0...5), location: Faker::Address.full_address, school_id: 37, profile_id: i, img: apiImgHelper)
  Posting.create(
  place: Faker::Restaurant.name, description: Faker::Restaurant.review, rating: rand(0...5), location: Faker::Address.full_address, school_id: 37, profile_id: i, img: apiImgHelper)
end
p "Created #{Posting.count} posts"




5.times do |i|
  Order.create(
    restaurant: Faker::Restaurant.name, order: Faker::Food.description, total: rand(5.00...25.00), tip: rand(1.00...10.00), pending: true, address: Faker::Address.full_address, profile_id: 1, school_id: 37)
  Order.create(
      restaurant: Faker::Restaurant.name, order: Faker::Food.description, total: rand(5.00...25.00), tip: rand(1.00...10.00), pending: true, address: Faker::Address.full_address, profile_id: 2, school_id: 37)
  Order.create(
        restaurant: Faker::Restaurant.name, order: Faker::Food.description, total: rand(5.00...25.00), tip: rand(1.00...10.00), pending: true, address: Faker::Address.full_address, profile_id: 3, school_id: 37)
  end
p "Created #{Order.count} orders"
