class CreateBuildingPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :building_photos do |t|
      t.integer :building_id
      t.string :photo
      t.string :caption

      t.timestamps
    end
  end
end
