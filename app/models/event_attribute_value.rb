class EventAttributeValue < ApplicationRecord
  belongs_to :event
  belongs_to :event_attribute

  def value=(value)
    update_attribute(:boolean_value, value) if event_attribute.boolean?
    update_attribute(:string_value, value) unless event_attribute.boolean?
  end

  def value
    return boolean_value if event_attribute.boolean?
    string_value
  end

  def type?
    event_attribute.field_type
  end
end
