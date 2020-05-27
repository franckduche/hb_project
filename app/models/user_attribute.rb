class UserAttribute < ApplicationRecord
  has_many :user_attribute_values, dependent: :destroy
  has_many :users, through: :user_attribute_values
  enum field_type: [:string, :boolean]
  after_create_commit :add_users

  private

  def add_users
    self.users = User.all
  end
end
