class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_user_id, :integer
  attribute :receiver_user_id, :integer
  attribute :listing_id, :integer
  attribute :body, :string

  # Direct associations

  belongs_to :receiver_user,
             resource: UserResource

  belongs_to :sender_user,
             resource: UserResource

  belongs_to :listing

  # Indirect associations
end
