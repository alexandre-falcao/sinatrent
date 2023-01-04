class AddAddressToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :address, :string
  end
end
