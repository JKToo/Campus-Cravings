class Comment < ApplicationRecord
  belongs_to :posting
  belongs_to :profile
end
