class UsersController < ApplicationController

    # do i want this? 
    def index 
        @users = User.all 
    end 

    def new
        @user = User.new
    end

    def show 
        @user = User.find_by(id: params[:id])
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            #log them in 
            session[:user_id] = @user.id
            redirect_to user_path(@user)  #can also do @user only 
        else 
            render :new 
        end 
    end     
    
private 
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
    
end
