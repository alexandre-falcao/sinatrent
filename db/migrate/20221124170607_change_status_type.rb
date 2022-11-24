class ChangeStatusType < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :available, :boolean, default: true
  end
end
