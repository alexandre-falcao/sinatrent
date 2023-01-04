class ChangeAdressColumnsFromInstruments < ActiveRecord::Migration[7.0]
  def change
    remove_column :instruments, :address
    add_column :instruments, :street,:string
    add_column :instruments, :number,:string
    add_column :instruments, :district,:string
    add_column :instruments, :city,:string
    add_column :instruments, :state,:string
  end
end
