class AddListingReferenceToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :listings
    add_index :favorites, :listing_id
    change_column_null :favorites, :listing_id, false
  end
end
