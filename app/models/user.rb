class User < ApplicationRecord
    has_and_belongs_to_many :user_attributes
    enum role: [:user, :vip, :admin]
    after_initialize :set_default_role, :if => :new_record?
  
    def set_default_role
      self.role ||= :user
    end
end
