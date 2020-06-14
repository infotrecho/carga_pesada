class CreateDriverMessengerId < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :messenger_id, :string
    add_index :drivers, :messenger_id, unique: true
  end
end
