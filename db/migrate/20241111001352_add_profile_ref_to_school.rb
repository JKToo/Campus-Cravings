class AddProfileRefToSchool < ActiveRecord::Migration[7.2]
  def change
    add_reference :profiles, :school, foreign_key: true
    add_reference :postings, :school, foreign_key: true
  end
end
