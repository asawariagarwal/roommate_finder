class Listing < ApplicationRecord
  enum unit_type: {"b2b_3b3b_1b"=>0} 

  # Direct associations

  has_many   :listing_photos,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  belongs_to :building

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    building.to_s
  end

end
