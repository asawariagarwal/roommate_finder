class AddPreferenceReferenceToAmenityPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :amenity_preferences, :preferences
    add_index :amenity_preferences, :preference_id
    change_column_null :amenity_preferences, :preference_id, false
  end
end
