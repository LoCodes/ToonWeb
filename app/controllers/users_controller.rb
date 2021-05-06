class UsersController < ApplicationController

    # do i want this? 
    def index 
        @users = User.all 
    end 

    def new
        if !logged_in?
            @user = User.new
        else
            redirect_to root_path
        end 

    end

    def show # users anime list now 
        
        @user = User.find_by(id: params[:id])
        redirect_to user_animes_path(@user)
        

    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            #log them in 
            session[:user_id] = @user.id
            redirect_to user_path(@user)  #can also do @user only 
        else 
            #show errors 
            render :new 
        end 
    end     
    
private 
    
    def user_params
        params.require(:user).permit( :username, :email, :password)
    end 
    
end

 