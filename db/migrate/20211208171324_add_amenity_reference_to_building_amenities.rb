class AddAmenityReferenceToBuildingAmenities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :building_amenities, :amenities
    add_index :building_amenities, :amenity_id
    change_column_null :building_amenities, :amenity_id, false
  end
end
