require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "in_radius returns correct locations" do
    center = Location.new lat: 15, lng: 15, radius: 5
    result = Location.in_radius(center)

    assert_equal result.count, 2
    assert_equal [12, 17], result.map(&:lat).sort
  end
end
