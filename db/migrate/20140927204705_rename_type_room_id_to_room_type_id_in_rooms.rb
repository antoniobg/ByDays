class RenameTypeRoomIdToRoomTypeIdInRooms < ActiveRecord::Migration
  def change
    rename_column :rooms, :type_room_id, :room_type_id
  end
end
