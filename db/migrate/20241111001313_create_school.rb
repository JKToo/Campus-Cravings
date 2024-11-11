class CreateSchool < ActiveRecord::Migration[7.2]
  def change
    create_table :schools do |t|
      t.string :school
      t.timestamps
    end
  end
end
