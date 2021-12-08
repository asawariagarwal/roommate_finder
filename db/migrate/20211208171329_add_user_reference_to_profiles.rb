class AddUserReferenceToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :profiles, :users
    add_index :profiles, :user_id
    change_column_null :profiles, :user_id, false
  end
end
