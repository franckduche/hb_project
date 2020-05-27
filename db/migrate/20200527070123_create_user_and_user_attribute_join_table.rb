class CreateUserAndUserAttributeJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :user_attributes, :users do |t|
      t.index :attribute_id
      t.index :user_id
      t.boolean :boolean_value
      t.string :string_value
    end
  end
end
