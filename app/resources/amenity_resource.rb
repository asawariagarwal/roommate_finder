class AmenityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :category, :string_enum, allow: Amenity.categories.keys

  # Direct associations

  # Indirect associations

end
