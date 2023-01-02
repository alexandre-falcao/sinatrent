class ChangePriceTypeFromInstruments < ActiveRecord::Migration[7.0]
  def change
    change_column :instruments, :price, :decimal, :precision => 8, :scale => 2
  end
end
