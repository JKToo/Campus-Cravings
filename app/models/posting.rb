class Posting < ApplicationRecord
  belongs_to :profile
  has_one :school
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :profile
end
