require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "add a new user" do
    user = User.create
    assert_equal 3, User.count
    assert_equal true, user.admin?
  end
end
