class AnimesController < ApplicationController
  before_action :redirect_if_not_logged_in


  # show ALL animes
  # route: '/animes' path/prefix: animes_path
  def index
    # byebug
    # if its a nested route 
      # render nester resource data 
    # else 

    if params[:genre_id] && @genre = Genre.find_by_id(params[:genre_id])   # to know its nested 
      # @genre = Genre.find_by_id(params[:genre_id])
      @animes = @genre.animes
    else 
      @error = "That genre does not exist yet." if params[:genre_id]
      @animes = Anime.all
    end 
  end

  #to render a new form
  #route: animes/new      path/prefix: new_anime_path
  def new
    if params[:genre_id]
      @genre = Genre.find_by(params[:genre_id])
      @anime = @genre.anime.build
    else
      @anime = Anime.new
    end 
  end

  #route: /animes       path/prefix:  animes_path
  # only when we submit a form is when we make a post request 
  def create  
    # @anime = Anime.new(anime_params)
    @anime = current_user.animes.build(anime_params)
    if @anime.save
      redirect_to anime_path(@anime) #show for now
    else 
      render :new 
    end 
  end 


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
    params.require(:anime).permit(:title, :content) #, :user_id, :genre_id
  end

end
