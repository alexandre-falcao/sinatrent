class AddCategoryToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_reference :instruments, :category, foreign_key: true
  end
end
