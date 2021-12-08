class Building < ApplicationRecord
  enum building_type: {"apartments_condos_townhouse"=>0} 

  # Direct associations

  has_many   :building_photos,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
