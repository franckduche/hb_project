class User < ApplicationRecord
  has_many :user_attribute_values, dependent: :destroy
  has_many :user_attributes, through: :user_attribute_values
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create_commit :add_user_attributes

  def attribute_by_name(attribute_name, value = nil)
    attribute_value = all_attributes.where(user_attributes: { label: attribute_name }).first

    if value.present?
      attribute_value.value = value
    end
  end

  def display_attributes_on_profile
    all_attributes
      .to_a
      .select { |a| a.user_attribute.display_on_profile }
      .map { |a| { label: a.user_attribute.label, value: a.value } }
  end

  def display_attributes_on_signup
    all_attributes
      .to_a
      .select { |a| a.user_attribute.display_on_signup }
      .map { |a| { label: a.user_attribute.label, value: a.value, type: a.type? } }
  end

  # will be used to avoid N+1 queries
  def all_attributes
    user_attribute_values.joins(:user_attribute).includes(:user_attribute)
  end

  private

  def set_default_role
    self.role ||= :user
  end

  def add_user_attributes
    self.user_attributes = UserAttribute.all
  end
end
