class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    logger.debug "---------------"
    @room = Room.new(
      title: params[:room][:title],
      file: params[:room][:file].read,
      room_id: current_room.id)
      #binding.pry
    if @room.save
      flash[:notice] = 'チャットルームを作成しました'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.users.delete(current_user)
    if room.destroy
      flash[:notice] = 'チャットルームを削除しました'
    end
      redirect_to root_path
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(title: params[:room][:title],file: params[:room][:file].read)
      flash[:notice] = "チャットルームを更新しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def get_image
    room = Room.find(params[:id])
    send_data room.file
  end
  
  def join
    @room = Room.find(params[:id])
    @room.users << current_user
    @room.save
  end
  
end
