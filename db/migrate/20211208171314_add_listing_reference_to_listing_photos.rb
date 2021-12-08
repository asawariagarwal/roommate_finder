class AddListingReferenceToListingPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :listing_photos, :listings
    add_index :listing_photos, :listing_id
    change_column_null :listing_photos, :listing_id, false
  end
end
