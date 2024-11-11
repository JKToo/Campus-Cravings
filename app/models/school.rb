class School < ApplicationRecord
  has_many :profile
  has_many :posting
end
