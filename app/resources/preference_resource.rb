class PreferenceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :budget_max, :float
  attribute :preferred_move_in, :date
  attribute :unit_type, :string_enum, allow: Preference.unit_types.keys
  attribute :cleanliness, :integer
  attribute :hosting, :integer
  attribute :neighborhood, :string
  attribute :notes, :string
  attribute :pet_friendly, :boolean
  attribute :roommie_gender_preference, :string_enum, allow: Preference.roommie_gender_preferences.keys

  # Direct associations

  belongs_to :user

  has_many   :amenity_preferences

  # Indirect associations

  many_to_many :amenities

end
