class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :building_id
      t.integer :unit_type
      t.integer :lease_length
      t.float :price
      t.date :earliest_move_in
      t.string :floorplan

      t.timestamps
    end
  end
end
