class CreateListingPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_photos do |t|
      t.integer :listing_id
      t.string :photo
      t.string :caption

      t.timestamps
    end
  end
end
