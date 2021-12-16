class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :room_id
      t.integer :user_id
      t.binary :file
      t.integer :chatroom_id
      t.string  :rooms
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
