class AmenityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :category, :string_enum, allow: Amenity.categories.keys

  # Direct associations

  has_many   :amenity_preferences

  has_many   :building_amenities

  # Indirect associations

end
