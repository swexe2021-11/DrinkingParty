class Top2Controller < ApplicationController
  def main
    render 'login'
  end

  def login
    logger.debug "---------------"
<<<<<<< HEAD
    user_pass = BCrypt::Password.create("sanriko")
    if BCrypt::Password.new(user_pass) == params[:pass2]
=======

>>>>>>> eb72fe10e0e1efbe8d80d601dde3cde3cabf7368
    login_password = BCrypt::Password.create("sanriko")
    if BCrypt::Password.new(login_password) == params[:pass2]
      flash[:notice] = 'ログインできました'
      session[:login_uid2] = params[:uid2]
      redirect_to rooms_path
    else
      flash[:notice] = 'ログインに失敗しました'
      render 'login'
    end
    end
  end

  def logout
    flash[:notice] = 'ログアウトに成功しました'
    session.delete(:login_uid2)
    redirect_to root_path
  end
end
