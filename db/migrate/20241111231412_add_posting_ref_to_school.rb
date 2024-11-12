class AddPostingRefToSchool < ActiveRecord::Migration[7.2]
  def change
    add_reference :postings, :profile, foreign_key: true
  end
end
