class AmenityPreferenceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :amenity_id, :integer
  attribute :preference_id, :integer

  # Direct associations

  # Indirect associations

end
