class ListingPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :listing

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    listing.to_s
  end

end
