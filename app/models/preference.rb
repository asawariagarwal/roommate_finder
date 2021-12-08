class Preference < ApplicationRecord
  enum roommie_gender_preference: {"male"=>0, "female"=>1, "no_preference"=>2} 

  enum unit_type: {"b"=>0, "b2b"=>1, "b3b"=>2, "flexible"=>3} 

  # Direct associations

  belongs_to :user

  has_many   :amenity_preferences,
             :dependent => :destroy

  # Indirect associations

  has_many   :amenities,
             :through => :amenity_preferences,
             :source => :amenity

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
