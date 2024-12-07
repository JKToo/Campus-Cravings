class Profile < ApplicationRecord
  belongs_to :user
  has_one :school
  has_many :posting
  has_many :comment
  has_many :order
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :posting


  def self.ransackable_attributes(auth_object = nil)
    [ "fname", "lname", "tag" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "" ]
    end
end
