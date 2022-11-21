class AddDefaultValuesToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :instruments, :status, "available"
  end
end
