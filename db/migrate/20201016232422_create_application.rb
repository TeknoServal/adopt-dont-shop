class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
