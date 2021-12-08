class BuildingAmenityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :building_id, :integer
  attribute :amenity_id, :integer

  # Direct associations

  belongs_to :amenity

  belongs_to :building

  # Indirect associations
end
