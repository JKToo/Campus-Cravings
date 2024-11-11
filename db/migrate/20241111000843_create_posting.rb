class CreatePosting < ActiveRecord::Migration[7.2]
  def change
    create_table :postings do |t|
      t.string :place
      t.text :description
      t.integer :rating
      t.string :location
      t.timestamps
    end
  end
end
