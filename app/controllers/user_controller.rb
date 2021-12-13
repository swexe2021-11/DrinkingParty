class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    logger.debug "---------------"
    @user = User.new(
      uid: params[:user][:uid],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
    if @user.valid? #validatesを実行してくれる
      flash[:notice] = 'ユーザ登録できました'
      @user.pass = BCrypt::Password.create(params[:user][:pass])
      @user.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = 'ユーザを削除しました'
    end
    redirect_to user_index_path
  end
  
  def show
     @user = User.find(params[:id])
  end
end
