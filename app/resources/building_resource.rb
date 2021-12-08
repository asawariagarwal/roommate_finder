class BuildingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string
  attribute :building_type, :string_enum, allow: Building.building_types.keys
  attribute :average_user_rating, :float
  attribute :neighborhood, :string

  # Direct associations

  has_many   :listings

  has_many   :building_amenities

  has_many   :building_photos

  # Indirect associations

end
