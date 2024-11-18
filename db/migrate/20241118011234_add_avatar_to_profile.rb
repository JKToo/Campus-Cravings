class AddAvatarToProfile < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :avatar, :string
    remove_column :profiles, :school
  end
end
