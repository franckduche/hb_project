class User < ApplicationRecord
  has_many :user_attribute_values, dependent: :destroy
  has_many :user_attributes, through: :user_attribute_values
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create_commit :add_user_attributes

  private

  def set_default_role
    self.role ||= :user
  end

  def add_user_attributes
    self.user_attributes = UserAttribute.all
  end
end
