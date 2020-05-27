require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "add a new user" do
    user = User.create
    assert_equal 3, User.count
    assert_not user.admin?
    assert_equal 2, user.user_attributes.count, "Existing user attributes automatically added"
  end

  test "user fills a custom attribute on his profile" do
  end

  test "user fills a custom attribute on the signup form" do
  end
end
