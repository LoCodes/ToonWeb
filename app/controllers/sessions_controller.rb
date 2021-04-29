class SessionsController < ApplicationController 

    def new
        if logged_in?
            redirect_to root_path 
        end 
    end 

    def create 
        # session[:user_id] = params[:user_id]
        # redirect_to '/'

        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            # flash[:message] = "Incorrect login credentials, try again."
            render :new 
        end 
    end 

    def destroy # logout 
        session.delete :user_id
        redirect_to login_path
    end




end 