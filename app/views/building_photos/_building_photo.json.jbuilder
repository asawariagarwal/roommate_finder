json.extract! building_photo, :id, :building_id, :photo, :caption, :created_at, :updated_at
json.url building_photo_url(building_photo, format: :json)
