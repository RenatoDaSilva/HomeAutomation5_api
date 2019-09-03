class AddRepeatToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :rate, :integer
    add_column :schedules, :interval, :integer
  end
end
