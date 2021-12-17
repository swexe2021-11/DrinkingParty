class ApplicationController < ActionController::Base
    private
    def current_user
        if session[:login_uid2]
        User.find_by(uid: session[:login_uid2])
        end
    end
    helper_method :current_user
        def current_user
            if session[:login_uid]
                User.find_by(uid: session[:login_uid])
            end
        end
    helper_method :current_user
    
end
