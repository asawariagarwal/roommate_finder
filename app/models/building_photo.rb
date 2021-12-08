class BuildingPhoto < ApplicationRecord
  # Direct associations

  belongs_to :building

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    building.to_s
  end

end
