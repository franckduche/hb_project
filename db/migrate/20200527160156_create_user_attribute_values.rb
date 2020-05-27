class CreateUserAttributeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attribute_values do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_attribute, null: false, foreign_key: true
      t.string :string_value
      t.boolean :boolean_value

      t.timestamps
    end
  end
end
