class AddIndexToRoomTypeIdInRooms < ActiveRecord::Migration
  def change
    add_index :rooms, :room_type_id
  end
end
