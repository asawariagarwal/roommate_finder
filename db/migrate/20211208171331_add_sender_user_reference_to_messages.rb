class AddSenderUserReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :sender_user_id
    add_index :messages, :sender_user_id
    change_column_null :messages, :sender_user_id, false
  end
end
