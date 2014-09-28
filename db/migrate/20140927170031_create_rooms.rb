class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :type_room_id
      
      t.timestamps
    end
  end
end
