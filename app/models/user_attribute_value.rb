class UserAttributeValue < ApplicationRecord
  belongs_to :user
  belongs_to :user_attribute

  def value=(value)
    update_attribute(:boolean_value, value) if user_attribute.boolean?
    update_attribute(:string_value, value) unless user_attribute.boolean?
  end

  def value
    return boolean_value if user_attribute.boolean?
    string_value
  end

  def type?
    user_attribute.field_type
  end
end
