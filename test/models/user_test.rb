require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "add a new user" do
    user = User.create
    assert_equal 3, User.count
    assert_not user.admin?
    assert_equal 2, user.user_attributes.count, "Existing user attributes automatically added"
  end
end
