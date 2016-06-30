require 'test_helper'

class DiscountSearchTest < ActiveSupport::TestCase
  test "finds correct discounts" do
    instance = DiscountSearch.new(query: "with")
    result = instance.perform_search
    assert_equal 2, result.count

    instance = DiscountSearch.new(query: "Man")
    result = instance.perform_search
    assert_equal 1, result.count

    instance = DiscountSearch.new(query: "Telephone")
    result = instance.perform_search
    assert_equal 0, result.count
  end
end
