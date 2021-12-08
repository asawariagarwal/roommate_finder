class AddBuildingReferenceToBuildingPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :building_photos, :buildings
    add_index :building_photos, :building_id
    change_column_null :building_photos, :building_id, false
  end
end
