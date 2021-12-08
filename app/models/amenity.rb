class Amenity < ApplicationRecord
  enum category: {"entertainment"=>0, "convenience"=>1, "luxury"=>2, "lifestyle"=>3} 

  # Direct associations

  has_many   :amenity_preferences,
             :dependent => :destroy

  has_many   :building_amenities,
             :dependent => :destroy

  # Indirect associations

  has_many   :buildings,
             :through => :building_amenities,
             :source => :building

  has_many   :user_preferences,
             :through => :amenity_preferences,
             :source => :preference

  # Validations

  # Scopes

  def to_s
    name
  end

end
