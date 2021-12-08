class User < ApplicationRecord
  # Direct associations

  has_many   :received_messages,
             :class_name => "Message",
             :foreign_key => "receiver_user_id",
             :dependent => :destroy

  has_many   :sent_messages,
             :class_name => "Message",
             :foreign_key => "sender_user_id",
             :dependent => :destroy

  has_many   :profiles,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  has_many   :preferences,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
