class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_user_id
      t.integer :receiver_user_id
      t.integer :listing_id
      t.text :body

      t.timestamps
    end
  end
end
