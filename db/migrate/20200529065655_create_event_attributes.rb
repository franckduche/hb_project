class CreateEventAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attributes do |t|
      t.string :label
      t.integer :field_type
      t.boolean :required

      t.timestamps
    end
  end
end
