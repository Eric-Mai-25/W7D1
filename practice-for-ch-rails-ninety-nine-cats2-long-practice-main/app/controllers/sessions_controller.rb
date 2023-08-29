class SessionsController < ApplicationController
    before_action :require_logged_out!, only: %i(create new)

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!
            redirect_to cats_url
        else
            render :new
        end
        
    end

    def destroy
        logout!
        redirect_to cats_url
    end
end
