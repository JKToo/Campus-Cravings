class AddAddresstoorders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :address, :string
  end
end
