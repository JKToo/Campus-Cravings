class Posting < ApplicationRecord
  has_many_attached :images
  belongs_to :profile
  has_one :school
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :profile

  def images_thumbnail
    images.map do |image|
      image.variant(resize_to_limit: [ 300, 300 ]).processed
    end
  end
end
