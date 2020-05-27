class UserAttribute < ApplicationRecord
    has_and_belongs_to_many :users
    enum field_type: [:string, :boolean]
end
