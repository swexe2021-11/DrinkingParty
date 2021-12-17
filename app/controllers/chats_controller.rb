#class ChatsController < ApplicationController
    #def show
      # どのユーザーとチャットするかを取得。
      #@user = User.find(params[:id])

      # カレントユーザーのuser_roomにあるroom_idの値の配列をroomsに代入。
      #chatrooms = current_user.rooms.pluck(:room_id)

      # user_roomモデルから
      # user_idがチャット相手のidが一致するものと、
      # room_idが上記roomsのどれかに一致するレコードを
      # user_roomsに代入。
      #rooms = Room.find_by(user_id: @user.id, room_id: chatrooms)
      
      # もしuser_roomが空でないなら
      #unless rooms.nil?
        # @roomに上記user_roomのroomを代入
        #@chatroom = rooms.chatroom
      #else
        # それ以外は新しくroomを作り、
        #@chatroom = Chatroom.new
        #@chatroom.save
        # user_roomをカレントユーザー分とチャット相手分を作る
        #Room.create(user_id: current_user.id, room_id: @chatroom.id)
        #Room.create(user_id: @user.id, room_id: @chatroom.id)
      #end
      
      #@chats = @chatroom.chats
      #@chat = Chat.new(room_id: @chatroom.id)
      
      
      # もしuser_roomが空なら
      #if rooms.nil?
      # 新しくroomを作り、
        #@room = Chatroom.new
        #@room.save
      # user_roomをカレントユーザー分とチャット相手分を作る
        #Room.create(user_id: current_user.id, room_id: @room.id)
        #Room.create(user_id: @user.id, room_id: @room.id)
      #end
      
      #unless rooms.nil?
        # もしuser_roomが空でないなら
        # @roomに上記user_roomのroomを代入
          #@room = rooms.chatroom
      #end
      
      
      #@chats = @room.chats
      #@chat = Chat.new(room_id: @room.id)
    #end
#end







#class ChatsController < ApplicationController
  
  #def index
    #@chats = Chat.all
  #end
  
  #def show
    #@room = Room.find(params[:id])
    #@room = current_user.rooms.pluck(:room_id)

    #unless rooms.nil?
      #@room = rooms.room
    #else
      #@room = Chatroom.new
      #@room.save
      #Room.create(user_id: current_user.id, room_id: @room.id)
      #Room.create(user_id: @user.id, room_id: @room.id)
    #end
    #@chats = @room.chats
    #@chat = Chat.new(room_id: @room.id)
  #end
  
  #def create
    #@chat = current_user.chats.new(chat_params)
    #@chat.save
    #redirect_to request.referer
  #end

  #private
  #def chat_params
    #params.require(:chat).permit(:message, :room_id)
  #end
#end





#class ChatsController < ApplicationController
  
  #def index
    #@chats = Chat.all
  #end
  
  #def show
    #@user = User.find(params[:id])
    #chatrooms = current_user.rooms.pluck(:chatroom_id)
    #rooms = Room.find_by(user_id: @user.id, chatroom_id: chatrooms)

    #unless rooms.nil?
      #@chatroom = rooms.room
    #else
      #@chatroom = Chatroom.new
      #@chatroom.save
      #Room.create(user_id: current_user.id, chatroom_id: @chatroom.id)
      #Room.create(user_id: @user.id, chatroom_id: @chatroom.id)
    #end
    #@chats = @chatroom.chats
    #@chat = Chat.new(chatroom_id: @chatroom.id)
  #end
  
  #def create
    #@chat = current_user.chats.new(chat_params)
    #@chat.save
    #redirect_to request.referer
  #end

  #private
  #def chat_params
    #params.require(:chat).permit(:message, :chatroom_id)
  #end
#end



class ChatsController < ApplicationController

  def show
  #BさんのUser情報を取得
    @user = User.find(params[:id])
  #user_roomsテーブルのuser_idがAさんのレコードのroom_idを配列で取得
    chatrooms = current_user.user_rooms.pluck(:room_id)
  #user_idがBさん(@user)で、room_idがAさんの属するroom_id（配列）となるuser_roomsテーブルのレコードを取得して、user_room変数に格納
  #これによって、AさんとBさんに共通のroom_idが存在していれば、その共通のroom_idとBさんのuser_idがuser_room変数に格納される（1レコード）。存在しなければ、nilになる。
    user_room = UserRoom.find_by(user_id: @user.id, room_id: chatrooms)

  #user_roomでルームを取得できなかった（AさんとBさんのチャットがまだ存在しない）場合の処理  
    chatroom = nil
    if user_room.nil?
   #roomのidを採番
      chatroom = Chatroom.new
      chatroom.save
    #採番したroomのidを使って、user_roomのレコードを2人分（Aさん用、Ｂさん用）作る（＝AさんとBさんに共通のroom_idを作る）
    #Bさんの@user.idをuser_idとして、room.idをroom_idとして、UserRoomモデルのがラムに保存（1レコード）
      UserRoom.create(user_id: @user.id, room_id: chatroom.id)
    #Aさんのcurrent_user.idをuser_idとして、room.idをroom_idとして、UserRoomモデルのカラムに保存（1レコード）
      UserRoom.create(user_id: current_user.id, room_id: chatroom.id)
    else
    #user_roomに紐づくroomsテーブルのレコードをroomに格納
     chatroom = user_room.room
    end

   #roomに紐づくchatsテーブルのレコードを@chatsに格納
    @chats = chatroom.chats
   #form_withでチャットを送信する際に必要な空のインスタンス
   #ここでroom.idを@chatに代入しておかないと、form_withで記述するroom_idに値が渡らない
    @chat = Chat.new(room_id: chatroom.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

end