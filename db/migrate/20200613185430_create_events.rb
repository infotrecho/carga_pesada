class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :geocode, array: true, null: false
      t.text :description, null: false
      t.string :classification, null: false
      t.json :metadata
      t.integer :priority, default: 0, null: false

      t.timestamps
    end
  end
end
