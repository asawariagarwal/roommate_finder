json.extract! listing, :id, :building_id, :unit_type, :lease_length, :price,
              :earliest_move_in, :floorplan, :created_at, :updated_at
json.url listing_url(listing, format: :json)
