class AddBuildingReferenceToBuildingAmenities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :building_amenities, :buildings
    add_index :building_amenities, :building_id
    change_column_null :building_amenities, :building_id, false
  end
end
