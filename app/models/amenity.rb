class Amenity < ApplicationRecord
  enum category: {"entertainment"=>0, "convenience"=>1, "luxury"=>2, "lifestyle"=>3} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
