class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :sent_messages,
             resource: MessageResource,
             foreign_key: :sender_user_id

  has_many   :profiles

  has_many   :favorites

  has_many   :preferences

  # Indirect associations

end
