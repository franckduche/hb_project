require 'test_helper'

class UserAttributeTest < ActiveSupport::TestCase
  test "there are two custom attributes in the fixtures" do
    assert_equal 2, UserAttribute.count
  end

  test "add a new custom attribute" do
    phone_label = "Phone"
    UserAttribute.create(label: phone_label, field_type: 1, display_on_profile: false, display_on_signup: true)
    assert_equal 3, UserAttribute.count
    assert_equal phone_label, UserAttribute.last.label
  end

  test "delete a custom attribute" do
    assert_equal 2, UserAttribute.count
    UserAttribute.last.delete
    assert_equal 1, UserAttribute.count
  end

  test "add/update/destroy a custom attribute update existing users accordingly" do
    assert_equal 0, User.first.user_attributes.count
    attribute = UserAttribute.create
    assert_equal 1, User.first.user_attributes.count, "The user attribute was correctly added to the existing Users"

    new_label = "label"
    assert_nil User.first.user_attributes.first.label
    attribute.label = new_label
    attribute.save
    assert_equal new_label, User.first.user_attributes.first.label, "The update of the user attribute was considered on the User's side"

    attribute.destroy
    assert_equal 0, User.first.user_attributes.count, "The user attribute was correctly removed from the User as well"
  end
end
