class DropDevices < ActiveRecord::Migration[6.0]
  def change
    drop_table :devices do |t|
      t.string :name
      t.integer :pin
      t.boolean :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end