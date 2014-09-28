class RoomType < ActiveRecord::Base
  
  # Relationships
  has_many :rooms, dependent: :destroy
  belongs_to :hotel

  def get_first_available(start_date, end_date)
    not_available = Booking.where('room_id IN (?) AND ((start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?))', room_ids, start_date, end_date, start_date, end_date).pluck(:room_id)
    available = room_ids - not_available
    available.any? ? Room.find(available.first) : nil
  end

  def to_s
    name
  end
end
