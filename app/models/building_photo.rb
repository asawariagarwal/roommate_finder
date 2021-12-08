class BuildingPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :building

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    building.to_s
  end

end
