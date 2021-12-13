class ApplicationController < ActionController::Base
    private
<<<<<<< HEAD
    def current_user
        if session[:login_uid2]
        User.find_by(uid: session[:login_uid2])
        end
    end
    helper_method :current_user
=======
        def current_user
            if session[:login_uid]
                User.find_by(uid: session[:login_uid])
            end
        end
        helper_method :current_user
>>>>>>> 668d7c2e4fb52450c0e1bbba718f17307f3029ea
end
