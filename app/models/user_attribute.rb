class UserAttribute < ApplicationRecord
    enum field_type: [:string, :boolean]
end
