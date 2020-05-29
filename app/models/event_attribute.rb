class EventAttribute < ApplicationRecord
  has_many :event_attribute_values, dependent: :destroy
  has_many :events, through: :event_attribute_values
  enum field_type: [:string, :boolean]
  after_create_commit :add_events

  private

  def add_events
    self.events = Event.all
  end
end
