class Message < ApplicationRecord
  # Direct associations

  belongs_to :receiver_user,
             class_name: "User"

  belongs_to :sender_user,
             class_name: "User"

  belongs_to :listing

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender_user.to_s
  end
end
