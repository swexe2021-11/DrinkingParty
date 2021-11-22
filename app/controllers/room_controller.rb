class RoomController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    logger.debug "---------------"
    #ログイン中にしたツイートリンクが表示されないのでsession[:user_id]が空であることは考慮しなくてよい
    user = User.find_by(uid: current_user.uid)
    @room = Room.new(message: params[:room][:message], user_id: user.id)
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
    redirect_to root_path
  end
end
