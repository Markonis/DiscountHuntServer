class Location < ActiveRecord::Base

  validates_presence_of :lat, :lng

  def self.in_radius(location)
    radius = location.radius
    where('lat >= :min_lat AND lat <= :max_lat AND lng >= :min_lng AND lng <= :max_lng', {
      max_lng: location.lng + radius,
      min_lng: location.lng - radius,
      max_lat: location.lat + radius,
      min_lat: location.lat - radius
    })
  end
end
