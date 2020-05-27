class AddRequiredFieldsToUserAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_attributes, :required_on_profile, :boolean
    add_column :user_attributes, :required_on_signup, :boolean
  end
end
