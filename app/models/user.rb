class User < ActiveRecord::Base

  belongs_to :photo
  belongs_to :location
  has_one :setting, dependent: :destroy
  has_many :discounts, dependent: :destroy

  validates_presence_of :location, :photo, :first_name, :last_name, :phone,
    :username, :password

  # after_create :create_setting

  attr_encrypted :password, key: 'This is a key that is 256 bits!!'
end
