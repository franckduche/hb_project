class Event < ApplicationRecord
  has_many :event_attribute_values, dependent: :destroy
  has_many :event_attributes, through: :event_attribute_values
  after_create_commit :add_event_attributes

  def attribute_by_name(attribute_name, value = nil)
    attribute_value = all_attributes.where(event_attributes: { label: attribute_name }).first

    if value.present?
      attribute_value.value = value
    end

    attribute_value
  end
  
  def display_attributes
  all_attributes
    .to_a
    .map { |a| { label: a.event_attribute.label, value: a.value, type: a.type?, required: a.event_attribute.required } }
end

  def all_attributes
    event_attribute_values.joins(:event_attribute).includes(:event_attribute)
  end

  private

  def add_event_attributes
    self.event_attributes = EventAttribute.all
  end
end
