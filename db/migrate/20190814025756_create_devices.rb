class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :pin
      t.boolean :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
