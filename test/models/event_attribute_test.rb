require 'test_helper'

class EventAttributeTest < ActiveSupport::TestCase
  test "manages event attributes" do
    label = "label"
    assert_equal 2, EventAttribute.count
    assert_equal 0, Event.first.event_attributes.count

    EventAttribute.create(label: label)

    assert_equal 3, EventAttribute.count
    assert_equal label, EventAttribute.last.label
    assert_equal 1, Event.first.event_attributes.count
  end

  test "make an event attribute optional" do
    required = false

    EventAttribute.create(required: required)

    assert_not EventAttribute.last.required
  end
end
