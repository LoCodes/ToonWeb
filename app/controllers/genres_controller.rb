class GenresController < ApplicationController

    def index 
        @genres = Genre.all
    end 

    def new 
        @genre = Genre.new
        redirect_to new_anime_path
    end 

    def create 
        @genre = Genre.new(genre_params)
        if @genre.save 
            redirect_to genre_path(@genre)
        else
            render :new 
        end 
    end 

    def show 
        @genre = Genre.find_by_id(params[:id])
    end 

    # def edit 
    # end 

    # def update 
    #     if @genre.update(genre_params)
    #         redirect_to genre_path(@genre)
    #     else 
    #         render :edit 
    #     end 
    # end 

private 

    def genre_params
        params.require(:genre).permit(:name)
    end 
end
