class Profile < ApplicationRecord
  enum gender: {"male"=>0, "female"=>1, "other"=>2} 

  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
