class ListingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :building_id, :integer
  attribute :unit_type, :string_enum, allow: Listing.unit_types.keys
  attribute :lease_length, :integer
  attribute :price, :float
  attribute :earliest_move_in, :date
  attribute :floorplan, :string

  # Direct associations

  has_many   :favorites

  belongs_to :building

  # Indirect associations

end
