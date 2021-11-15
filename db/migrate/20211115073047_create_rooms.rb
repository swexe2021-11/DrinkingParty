class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :room_id
      t.inreger :user_id
      t.binary :file

      t.timestamps
    end
  end
end
