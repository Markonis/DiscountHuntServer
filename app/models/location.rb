class Location < ActiveRecord::Base

  validates_presence_of :lat, :lng
end
