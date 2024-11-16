class Adddeliverystatustoorder < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :delivery_status, :integer, array: true, default: []
  end
end
