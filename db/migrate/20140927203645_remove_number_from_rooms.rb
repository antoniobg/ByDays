class RemoveNumberFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :number
  end
end
