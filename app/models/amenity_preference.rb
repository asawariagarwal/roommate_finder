class AmenityPreference < ApplicationRecord
  # Direct associations

  belongs_to :amenity

  belongs_to :preference

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    amenity.to_s
  end

end
