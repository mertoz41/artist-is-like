class ApplicationController < ActionController::Base
    helper_method :current_user 

    def homepage
    end

    def about 
    end

    def current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:user_id])
            return @current_user
        end
    end

    def logged_in?
        return !!current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end

end
