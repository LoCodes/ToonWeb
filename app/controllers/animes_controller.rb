class AnimesController < ApplicationController
  # before_action :redirect_if_not_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]


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
    if params[:genre_id] && @genre = Genre.find_by_id(params[:genre_id])
      @anime = @genre.animes.build(anime_params)
    else 
      @anime = current_user.animes.build(anime_params)
      # @anime = Anime.new(anime_params)

      # @anime.build_genre #need it for nested routed  Doesnt work 
    end 
      if @anime.save 
        redirect_to animes_path #or redirect them to genre show page
      else
        render :new
      end
  end 




  def show
    @anime = Anime.find_by(id: params[:id])
  end



  #route:       path/prefix:
  def edit
    @anime = Anime.find_by_id(params[:id])
    @genre = Genre.find_by_id(params[:id]) #keep
  end

  #route:       path/prefix:
  def update 
    @anime = Anime.find_by_id(params[:id])
    @anime.update(anime_params)
    redirect_to anime_path(@anime)
  end 

  #route:       path/prefix:

  # NOT DONE 
  def destroy 
      @anime = Anime.find(params[:id])
      @anime.destroy

      redirect_to animes_path


  end 

private

  def anime_params 
    params.require(:anime).permit(:title, :content, :user_id, :genre_id, genre_attributes: [:name]) 
  end

  def correct_user
    @anime = Anime.find_by(id: params[:id]) # find the post
    unless current_user?(@anime.user)
       
      redirect_to user_path(current_user)  #send them to their own list of animes 
      # @current_user_error
    end
  end

    # Set this in before_action WHEN REFRACTORING!! 
  def set_anime
    @anime = Anime.find_by(id: params[:id])
  end 

end
