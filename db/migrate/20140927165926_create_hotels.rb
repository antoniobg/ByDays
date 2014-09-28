class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.string :address

      t.timestamps
    end
    add_index :hotels, :name
  end
end
