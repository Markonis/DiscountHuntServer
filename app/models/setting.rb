class Setting < ActiveRecord::Base
  belongs_to :user, inverse_of: :setting

  validates_presence_of :search_radius
end
