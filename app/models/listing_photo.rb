class ListingPhoto < ApplicationRecord
  # Direct associations

  belongs_to :listing

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    listing.to_s
  end

end
