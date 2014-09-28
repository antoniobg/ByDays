class Booking < ActiveRecord::Base  
  # Relationships
  belongs_to :room

  def hotel 
    room.room_type.hotel.name
  end

  def room_type
    room.room_type.name
  end
end
