class ChatController < ApplicationController
  
  def index
    @chats = Chat.all
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    redirect_to request.referer
  end
  
  def show
    @room = current_user.rooms.pluck(:room_id)
    @room = Room.find(params[:id])
  end

end
