class UserAttribute < ApplicationRecord
    has_and_belongs_to_many :users
    enum field_type: [:string, :boolean]
    after_create_commit :add_users

    private

    def add_users
      self.users = User.all
    end
end
