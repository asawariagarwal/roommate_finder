json.extract! listing_photo, :id, :listing_id, :photo, :caption, :created_at,
              :updated_at
json.url listing_photo_url(listing_photo, format: :json)
