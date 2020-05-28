require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "add a new user" do
    user = User.create
    assert_equal 3, User.count
    assert_not user.admin?
    assert_equal 2, user.user_attributes.count, "Existing user attributes automatically added"
  end

  test "custom attributes displayed" do
    boolean_value = true
    string_value = "test"

    user = User.create
    user.user_attribute_values.each do |att_val|
      if att_val.type? == "boolean"
        att_val.value = boolean_value
      else
        att_val.value = string_value
      end
    end

    attributes = user.display_attributes_on_profile

    assert_equal 2, attributes.size
    assert_equal string_value, attributes.first.dig(:value)
    assert_equal boolean_value, attributes.last.dig(:value)
  end

  test "user fills a custom attribute on his profile" do
    boolean_value = true

    user = User.create

    label = user.display_attributes_on_profile.last.dig(:label)
    user.attribute_by_name(label, boolean_value)

    assert_equal boolean_value, user.display_attributes_on_profile.last.dig(:value)
  end

  test "user fills a custom attribute on the signup form" do
    string_value = "test"

    user = User.create

    label = user.display_attributes_on_signup.first.dig(:label)
    user.attribute_by_name(label, string_value)

    assert_equal string_value, user.display_attributes_on_signup.first.dig(:value)
  end
end
