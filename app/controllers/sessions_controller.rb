class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:login][:email].downcase)
        if user && user.authenticate(params[:login][:password]) && !user.role
            session[:user_id]= user.id.to_s
            redirect_to new_order_path, notice: 'Successfully logged in !'
        elsif user && user.authenticate(params[:login][:password]) && user.role
            session[:user_id]= user.id.to_s
            redirect_to orders_admin_history_path, notice: 'Successfully logged in as admin!'
        else
            flash.now.alert="Incorrect email or password, try again."
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path, notice: 'Logged out'
    end
end

