class AddIndexToCreatedAtInBookings < ActiveRecord::Migration
  def change
    add_index :bookings, :created_at
  end
end
