class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :event, type: :uuid, null: false, foreign_key: true
      t.references :trip, type: :uuid, null: false, foreign_key: true
      t.boolean :notified, null: false, default: false

      t.timestamps
    end
  end
end
