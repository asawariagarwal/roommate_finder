class CreateAmenityPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :amenity_preferences do |t|
      t.integer :amenity_id
      t.integer :preference_id

      t.timestamps
    end
  end
end
