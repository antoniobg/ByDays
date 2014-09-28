class AddIndexToStartDateInBookings < ActiveRecord::Migration
  def change
    add_index :bookings, :start_date
  end
end
