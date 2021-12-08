class BuildingAmenity < ApplicationRecord
  # Direct associations

  belongs_to :amenity

  belongs_to :building

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    building.to_s
  end
end
