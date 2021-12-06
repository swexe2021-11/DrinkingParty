class AdminuserController < ApplicationController
    before_action :if_not_admin
    before_action :set_restaurant, only: [:show, :edit, :destroy]
    
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        logger.debug "---------------"
        @user = User.new(
        uid: params[:adminuser][:uid2],
        password: params[:adminuser][:password],
        password_confirmation: params[:adminuser][:password_confirmation])
        if @user.valid? #validatesを実行してくれる
            flash[:notice] = 'ユーザ登録できました'
            @user.pass = BCrypt::Password.create(params[:adminuser][:pass])
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
        redirect_to admin_index_path
    end
    
    

end
