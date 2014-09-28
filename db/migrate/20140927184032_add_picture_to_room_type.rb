class AddPictureToRoomType < ActiveRecord::Migration
  def change
    add_column :room_types, :picture, :string
  end
end
