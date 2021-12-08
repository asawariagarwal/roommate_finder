class AddBuildingReferenceToListings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :listings, :buildings
    add_index :listings, :building_id
    change_column_null :listings, :building_id, false
  end
end
