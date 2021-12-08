class Building < ApplicationRecord
  enum building_type: { "apartments_condos_townhouse" => 0 }

  # Direct associations

  has_many   :listings,
             dependent: :destroy

  has_many   :building_amenities,
             dependent: :destroy

  has_many   :building_photos,
             dependent: :destroy

  # Indirect associations

  has_many   :amenities,
             through: :building_amenities,
             source: :amenity

  # Validations

  # Scopes

  def to_s
    name
  end
end
