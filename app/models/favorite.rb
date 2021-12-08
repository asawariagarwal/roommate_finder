class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :listing

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
