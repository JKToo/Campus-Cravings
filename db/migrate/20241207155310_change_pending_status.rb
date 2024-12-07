class ChangePendingStatus < ActiveRecord::Migration[7.2]
  def change
    change_column_default(:orders, :pending, true)
  end
end
