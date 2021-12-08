class Listing < ApplicationRecord
  enum unit_type: {"b2b_3b3b_1b"=>0} 

  # Direct associations

  belongs_to :building

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    building.to_s
  end

end
