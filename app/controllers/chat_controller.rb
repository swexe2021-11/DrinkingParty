class ChatController < ApplicationController
    def show
      # どのユーザーとチャットするかを取得。
      @user = User.find(params[:id])

      # カレントユーザーのuser_roomにあるroom_idの値の配列をroomsに代入。
      rooms = current_user.rooms.pluck(:room_id)

      # user_roomモデルから
      # user_idがチャット相手のidが一致するものと、
      # room_idが上記roomsのどれかに一致するレコードを
      # user_roomsに代入。
      rooms = Room.find_by(user_id: @user.id, room_id: rooms)

      # もしuser_roomが空でないなら
      unless rooms.nil?
        # @roomに上記user_roomのroomを代入
        @chatroom = rooms.room
      else
        # それ以外は新しくroomを作り、
        @chatroom = Chatroom.new
        @chatroom.save
        # user_roomをカレントユーザー分とチャット相手分を作る
        UserRoom.create(user_id: current_user.id, room_id: @chatroom.id)
        UserRoom.create(user_id: @user.id, room_id: @chatroom.id)
      end
      @chats = @chatroom.chats
      @chat = Chat.new(room_id: @chatroom.id)
    end
end
