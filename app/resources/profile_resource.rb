class ProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :gender, :string_enum, allow: Profile.genders.keys
  attribute :age, :integer
  attribute :occupation, :string
  attribute :current_city, :string
  attribute :pet_owner, :boolean
  attribute :pet_description, :string
  attribute :about_me, :string

  # Direct associations

  # Indirect associations

end
