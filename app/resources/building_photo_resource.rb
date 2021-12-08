class BuildingPhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :building_id, :integer
  attribute :photo, :string
  attribute :caption, :string

  # Direct associations

  # Indirect associations

end
