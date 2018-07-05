class CreateEscapes < ActiveRecord::Migration[5.2]
  def change
    create_table :escapes do |t|
      t.text :payload, null: false
      t.text :error_message
      t.string :organiser
      t.string :prisoner
      t.boolean :success, null: false, default: false
      t.string :ip_address, null: false
      t.integer :cell, null: false, default: 1024

      t.timestamps null: false
    end
  end
end
