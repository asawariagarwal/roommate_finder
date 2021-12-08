class AddReceiverUserReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :receiver_user_id
    add_index :messages, :receiver_user_id
    change_column_null :messages, :receiver_user_id, false
  end
end
