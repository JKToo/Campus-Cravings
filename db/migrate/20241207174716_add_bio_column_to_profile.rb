class AddBioColumnToProfile < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :bio, :text
  end
end
