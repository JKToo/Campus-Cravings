class AddSchoolRefToOrder < ActiveRecord::Migration[7.2]
  def change
    add_reference :orders, :school, foreign_key: true
  end
end
