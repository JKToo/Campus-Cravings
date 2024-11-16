class AddProfileRefToOrder < ActiveRecord::Migration[7.2]
  def change
    add_reference :orders, :profile, foreign_key: true
  end
end
