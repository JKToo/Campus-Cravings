class AddProfileReferenceToUser < ActiveRecord::Migration[7.2]
  def change
    add_reference :profiles, :user, foreign_key: true
  end
end
