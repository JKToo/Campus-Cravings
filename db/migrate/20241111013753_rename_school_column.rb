class RenameSchoolColumn < ActiveRecord::Migration[7.2]
  def change
    rename_column :schools, :school, :name
  end
end
