class UsersController < ApplicationController
    def index
        @animes = Anime.all
      end
    
      def new
        @anime = Anime.new
      end
    
      def create
        @anime = Anime.new(anime_params)
        if @anime.save 
          redirect_to anime_path(@anime) 
        else 
          render :new
        end 
      end
    
    private 
    
      def anime_params
        params.require(:anime).permit(:username, :email, :password)
      end 
    
end
