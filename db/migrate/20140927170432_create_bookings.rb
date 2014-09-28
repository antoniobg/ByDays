class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :customer_name
      t.string :customer_email
      t.integer :room_id

      t.timestamps
    end
    add_index :bookings, :customer_email
    add_index :bookings, :customer_name
  end
end
