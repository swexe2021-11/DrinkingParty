class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :room_id
      t.integer :user_id
      t.integer :chatroom_id
      t.string  :rooms
      t.string :message
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
