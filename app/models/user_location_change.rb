class UserLocationChange < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :location

  accepts_nested_attributes_for :location

  after_create :set_user_location

  def set_user_location
    user.location = location
    user.save
  end
end
