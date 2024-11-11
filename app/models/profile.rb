class Profile < ApplicationRecord
  belongs_to :user
  has_one :school
  has_many :posting
end
