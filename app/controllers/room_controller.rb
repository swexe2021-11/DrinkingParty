class RoomController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    logger.debug "---------------"
<<<<<<< HEAD
    @room = Room.new(
      title: params[:room][:title],
      file: params[:room][:file].read)
=======
    @room = Room.new(title: params[:room][:title])
>>>>>>> 668d7c2e4fb52450c0e1bbba718f17307f3029ea
    if @room.save
      flash[:notice] = 'チャットルームを作成しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.destroy
      flash[:notice] = 'チャットルームを削除しました'
    end
      redirect_to root_path
  end
  
  def get_image
    room = Room.find(params[:id])
    send_data room.file
  end
  
end
