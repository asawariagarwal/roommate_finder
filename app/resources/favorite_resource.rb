class FavoriteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :listing_id, :integer

  # Direct associations

  belongs_to :user

  belongs_to :listing

  # Indirect associations
end
