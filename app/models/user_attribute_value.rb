class UserAttributeValue < ApplicationRecord
  belongs_to :user
  belongs_to :user_attribute

  def value(value = nil)
    if value
      @boolean_value = value if user_attribute.boolean?
      @string_value = value
    end

    return @boolean_value if user_attribute.boolean?
    @string_value
  end
end
