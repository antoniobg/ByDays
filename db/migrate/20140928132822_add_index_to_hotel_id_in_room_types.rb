class AddIndexToHotelIdInRoomTypes < ActiveRecord::Migration
  def change
    add_index :room_types, :hotel_id
  end
end
