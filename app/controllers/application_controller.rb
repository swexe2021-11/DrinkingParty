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
>>>>>>> eb72fe10e0e1efbe8d80d601dde3cde3cabf7368
        def current_user
            if session[:login_uid]
                User.find_by(uid: session[:login_uid])
            end
        end
<<<<<<< HEAD
    helper_method :current_user
    
=======
        helper_method :current_user
>>>>>>> eb72fe10e0e1efbe8d80d601dde3cde3cabf7368
end
