class BuildingAmenityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :building_id, :integer
  attribute :amenity_id, :integer

  # Direct associations

  # Indirect associations

end
