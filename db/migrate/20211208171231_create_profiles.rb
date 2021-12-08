class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.integer :age
      t.string :occupation
      t.string :current_city
      t.boolean :pet_owner
      t.string :pet_description
      t.text :about_me

      t.timestamps
    end
  end
end
