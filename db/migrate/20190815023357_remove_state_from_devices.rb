class RemoveStateFromDevices < ActiveRecord::Migration[6.0]
  def change

    remove_column :devices, :state, :boolean
  end
end
