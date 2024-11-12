class AddImgToPostings < ActiveRecord::Migration[7.2]
  def change
    add_column :postings, :img, :string
  end
end
