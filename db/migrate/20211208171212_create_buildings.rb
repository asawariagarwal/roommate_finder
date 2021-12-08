class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :location
      t.integer :building_type
      t.float :average_user_rating
      t.string :neighborhood

      t.timestamps
    end
  end
end
