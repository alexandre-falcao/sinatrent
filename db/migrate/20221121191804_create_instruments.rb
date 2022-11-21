class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :name
      t.string :status
      t.float :price

      t.timestamps
    end
  end
end
