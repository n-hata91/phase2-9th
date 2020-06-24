class RenameNameColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :name, :user_id
  end
end
