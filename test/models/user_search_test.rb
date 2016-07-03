require 'test_helper'

class UserSearchTest < ActiveSupport::TestCase
  test "finds the correct users with the given query" do
    instance = UserSearch.new query: 'John'
    result = instance.perform_search
    assert_equal 1, result.count

    instance = UserSearch.new query: '123456'
    result = instance.perform_search
    assert_equal 3, result.count

    instance = UserSearch.new query: 'Noresult'
    result = instance.perform_search
    assert_equal 0, result.count
  end

  test "finds the correct users by the given hardware_uuid" do
    instance = UserSearch.new hardware_uuid: 'ABCD'
    result = instance.perform_search
    assert_equal 1, result.count
    assert_equal 'John', result.first.first_name
  end

  test "finds the correct users by given friends_with" do
    instance = UserSearch.new friends_with: 1
    result = instance.perform_search
    assert_equal 1, result.count
    assert_equal 'Lisa', result.first.first_name

    instance = UserSearch.new friends_with: 2
    result = instance.perform_search
    assert_equal 1, result.count
    assert_equal 'John', result.first.first_name
  end
end
