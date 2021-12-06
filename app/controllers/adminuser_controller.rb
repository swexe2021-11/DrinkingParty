class AdminuserController < ApplicationController
    before_action :if_not_admin
    before_action :set_user, only: [:show, :edit, :destroy]
    
    
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
            @user.pass = BCrypt::Password.create(params[:user][:password])
            @user.save
            redirect_to users_path
        else
            render 'new'
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            flash[:notice] = 'ユーザを削除しました'
        end
        redirect_to users_path
    end
    
    
    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end
