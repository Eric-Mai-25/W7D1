class UsersController < ApplicationController
    before_action :require_logged_out!

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!
            redirect_to :cats_url
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username,:password)
    end
    
end
