class ApplicationController < ActionController::Base
    private
    def current_user
        if session[:login_uid2]
            User.find_by(uid: session[:login_uid2])
        end
    end
    helper_method :current_user

<<<<<<< HEAD
        def current_user
            if session[:login_uid]
                User.find_by(uid: session[:login_uid])
            end
        end
    helper_method :current_user
    
    private
    def current_room
        if session[:room_id]
            room = Room.find(session[:room_id])
        else
            room = Room.create
            session[:room_id] = room.id
        end
            room
    end
    helper_method :current_room
=======
    def current_user
        if session[:login_uid]
            User.find_by(uid: session[:login_uid])
        end
    end
    helper_method :current_user
>>>>>>> c406ff981eaa3a523e0d4f1cb8311c8a8b7c94b3
end
