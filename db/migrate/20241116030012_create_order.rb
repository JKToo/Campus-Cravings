class CreateOrder < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :restaurant
      t.string :order
      t.decimal :total
      t.decimal :tip
      t.boolean :pending
      t.timestamps
    end
  end
end
