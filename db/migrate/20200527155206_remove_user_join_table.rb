class RemoveUserJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_attributes_users
  end
end
