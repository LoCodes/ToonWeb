class AnimesController < ApplicationController
  # before_action :redirect_if_not_logged_in


  # show ALL anime s
  # route: '/animes' path/prefix: animes_path
  def index
    # if its a nested route 
      # render nester resource data 
    # else 

    if params[:genre_id] && @genre = Genre.find_by_id(params[:genre_id])   # to know its nested 
      # @genre = Genre.find_by_id(params[:genre_id])
      @animes = @genre.animes
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @animes = @user.animes
    else 
      @error = "That genre does not exist yet." if params[:genre_id] 
      @error1 = "That user does not exist yet." if params[:user_id]
      @animes = Anime.all
    end 
  end

  #to render a new form
  #route: animes/new      path/prefix: new_anime_path
  # def new
  #   @genre = Genre.find_by_id(params[:genre_id])

  #   if params[:genre_id]
  #     @anime = @genre.animes.build #creates empty associated objects 
      
  #   else
  #     @anime = Anime.new
  #     # # @anime.genre = @genre 
  #     # @anime.genres.build 
  #     # @anime.build_genre #?? double check
  #   end 
  # end

  def new 
    # THIS IS WHAT YOU WORKING ON !!!!!!
    if params[:genre_id] && @genre = Genre.find_by_id(params[:genre_id])   # to know its nested 
      @anime = @genre.animes.build #== Genre.new(genre_id: @genre.id)
    else 

      @anime = Anime.new
      @anime.build_genre
    end 

  end 

  #route: /animes       path/prefix:  animes_path
  # only when we submit a form is when we make a post request 
  def create 
    # @anime = Anime.new(anime_params) 
    @anime = current_user.animes.build(anime_params)
    if @anime.save 
      redirect_to animes_path
    else 
      render :new 
    end 
  end 

  # def create  
  #   # @anime = Anime.new(anime_params)
  #   # @anime = current_user.animes.build(anime_params)
  #   if params[:genre_id]
  #     @genre = Genre.find_by_id(params[:genre_id])
  #     @anime = @genre.animes.build(anime_params)
  #   else
  #     @anime = Anime.new(anime_params)
  #   end 

  #   if @anime.save 
  #     redirect_to genre_animes_path(@anime.genre)
  #   else 
  #     render :new 
  #   end 
  # end 


  def show
    @anime = Anime.find_by(id: params[:id])
  end



  #route:       path/prefix:
  def edit
  end

  #route:       path/prefix:
  def update 
  end 

  #route:       path/prefix:
  def destroy 
  end 

private

  def anime_params 
    params.require(:anime).permit(:title, :content, :user_id, :genre_id, genre_attributes: [:name]) 
  end

end
