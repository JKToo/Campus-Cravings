class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :tag
      t.string :school
      t.boolean :status

      t.timestamps
    end
  end
end
