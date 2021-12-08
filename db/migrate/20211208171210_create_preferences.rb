class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.float :budget_max
      t.date :preferred_move_in
      t.integer :unit_type
      t.integer :cleanliness
      t.integer :hosting
      t.string :neighborhood
      t.text :notes
      t.boolean :pet_friendly
      t.integer :roommie_gender_preference

      t.timestamps
    end
  end
end
