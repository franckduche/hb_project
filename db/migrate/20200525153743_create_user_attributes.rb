class CreateUserAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attributes do |t|
      t.string :label
      t.integer :field_type
      t.boolean :display_on_profile
      t.boolean :display_on_signup

      t.timestamps
    end
  end
end
