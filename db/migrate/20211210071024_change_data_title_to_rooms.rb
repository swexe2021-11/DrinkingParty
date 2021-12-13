class ChangeDataTitleToRooms < ActiveRecord::Migration[5.2]
  def change
    change_column :rooms, :title, :string
  end
end
