class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :title
      t.integer :room_id
      t.integer :user_id
      t.binary :file

      t.timestamps
    end
  end
end
