class UsersController < ApplicationController
    def new
        @user = User.new
        @user.role=0
    end

    def create
        @user= User.new(user_params)
        @user.email.downcase!

        if @user.save
            flash[:notice] = "Account was successfully created!"
            redirect_to login_path
        else
            flash.now.alert="Oops, could not create account. Please make sure you are using valid email and password and try again."
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end
    
end
