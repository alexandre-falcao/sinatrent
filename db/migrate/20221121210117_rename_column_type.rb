class RenameColumnType < ActiveRecord::Migration[7.0]
  def change
    rename_column :instruments, :type, :instrument_type
  end
end
