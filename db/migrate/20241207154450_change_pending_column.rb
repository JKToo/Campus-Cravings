class ChangePendingColumn < ActiveRecord::Migration[7.2]
  def change
    change_column :orders, :pending, :boolean, default: true
  end
end
