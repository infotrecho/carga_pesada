class ChangeDriverTrustedToBoolean < ActiveRecord::Migration[6.0]
  def change
    remove_column :drivers, :trusted
    add_column :drivers, :trusted, :boolean, default: false
  end
end