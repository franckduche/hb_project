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
end
