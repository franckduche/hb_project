require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "fills a custom attribute for an event" do
    label = EventAttribute.last.label
    event = Event.create
    value = "test"

    attribute_value = event.attribute_by_name(label, value)

    assert_equal value, attribute_value.value
    assert_equal value, event.attribute_by_name(label).value
  end

  test "reads an event's custom attributes" do
    event = Event.create

    assert_equal 2, event.display_attributes.count
  end
end
