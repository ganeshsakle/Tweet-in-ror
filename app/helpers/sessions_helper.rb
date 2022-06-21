module SessionsHelper

    #log in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current Logged-in user (if any?) 
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end 
    end

    def logged_in?
        !current_user.nil?  #checking-> current_user is not nil
        #current_user.nil? return false when user is logged-in
    end

    def log_out
        session.delete(:user_id)
        @current_user=nil
    end

end
