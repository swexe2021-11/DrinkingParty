class Top2Controller < ApplicationController
  def main
    render 'login'
  end

  def login
    logger.debug "---------------"
    login_password = BCrypt::Password.create("sanriko")
    if BCrypt::Password.new(login_password) == params[:pass2]
      flash[:notice] = 'ログインできました'
      session[:login_uid2] = params[:uid]
      redirect_to room_index_path
    else
      flash[:notice] = 'ログインに失敗しました'
      render 'login'
    end
  end

  def logout
    flash[:notice] = 'ログアウトに成功しました'
    session.delete(:login_uid2)
    redirect_to root_path
  end
end
