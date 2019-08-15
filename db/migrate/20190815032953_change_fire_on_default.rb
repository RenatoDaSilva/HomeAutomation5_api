class ChangeFireOnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :schedules, :fire_on, :datetime, :default => DateTime.now
  end
end
