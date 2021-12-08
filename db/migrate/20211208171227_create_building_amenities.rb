class CreateBuildingAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :building_amenities do |t|
      t.integer :building_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
