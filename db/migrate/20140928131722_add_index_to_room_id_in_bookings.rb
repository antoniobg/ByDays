class AddIndexToRoomIdInBookings < ActiveRecord::Migration
  def change
    add_index :bookings, :room_id
  end
end
