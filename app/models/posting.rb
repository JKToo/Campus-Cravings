class Posting < ApplicationRecord
  has_many_attached :images
  belongs_to :profile
  has_one :school
  has_many :comment
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :profile
  def images_thumbnail
    images.map do |image|
      image.variant(resize_to_limit: [ 400, 400 ]).processed
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    [ "description", "location", "place", "school_id", "place" ]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "school" ]
  end
end
