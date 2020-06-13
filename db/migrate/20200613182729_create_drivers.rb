class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers, id: :uuid do |t|
      t.string :name
      t.string :phone
      t.string :trusted, null: false, default: false

      t.timestamps
    end
  end
end
