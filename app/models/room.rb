class Room < ActiveRecord::Base

  # Relationships
  has_many :bookings, dependent: :destroy
  belongs_to :room_type

  def is_available?(start_date, end_date)
    Booking.where('room_id = ? AND ((start_date >= ? AND start_date <= ?) OR (end_date >= ? AND end_date <= ?))', self.id, start_date, start_date, end_date, end_date).count.zero?
  end
end
