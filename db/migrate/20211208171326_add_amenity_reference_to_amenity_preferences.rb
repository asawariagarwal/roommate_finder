class AddAmenityReferenceToAmenityPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :amenity_preferences, :amenities
    add_index :amenity_preferences, :amenity_id
    change_column_null :amenity_preferences, :amenity_id, false
  end
end
