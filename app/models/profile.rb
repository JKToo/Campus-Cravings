class Profile < ApplicationRecord
  belongs_to :user
  has_one :school
  has_many :posting
  accepts_nested_attributes_for :school
end
