class CreateEventAttributeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attribute_values do |t|
      t.references :event, null: false, foreign_key: true
      t.references :event_attribute, null: false, foreign_key: true
      t.string :string_value
      t.boolean :boolean_value

      t.timestamps
    end
  end
end
