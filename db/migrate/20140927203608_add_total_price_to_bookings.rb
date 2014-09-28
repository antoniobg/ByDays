class AddTotalPriceToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :total_price, :decimal
  end
end
