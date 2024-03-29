class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token] )
    end

    def login!
        session[:session_token] = @user.reset_session_token!
        current_user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil 
        @current_user = nil
    end

    def logged_in?
        !!@current_user
    end

    private

    def require_logged_out!
        redirect_to cats_url if logged_in?
    end

end