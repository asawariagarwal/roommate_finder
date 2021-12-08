class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_user_id, :integer
  attribute :receiver_user_id, :integer
  attribute :listing_id, :integer
  attribute :body, :string

  # Direct associations

  # Indirect associations

end