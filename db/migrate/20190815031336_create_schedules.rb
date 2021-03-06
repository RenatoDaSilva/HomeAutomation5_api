class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :pin
      t.integer :state
      t.datetime :fire_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
