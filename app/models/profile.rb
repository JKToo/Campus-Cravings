class Profile < ApplicationRecord
  belongs_to :user
  has_one :school
  has_many :posting
  has_many :order
  accepts_nested_attributes_for :school
end
