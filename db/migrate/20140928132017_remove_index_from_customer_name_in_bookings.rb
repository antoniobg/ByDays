class RemoveIndexFromCustomerNameInBookings < ActiveRecord::Migration
  def change
    remove_index :bookings, :customer_name
  end
end
