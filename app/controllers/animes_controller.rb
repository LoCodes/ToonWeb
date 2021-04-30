class AnimesController < ApplicationController
  before_action :redirect_if_not_logged_in


  # show ALL animes
  # route: '/animes' path/prefix: animes_path
  def index
    @animes = Anime.all
  end

  #to render a new form
  #route: animes/new      path/prefix: new_anime_path
  def new
    @anime = Anime.new
  end

  #route: /animes       path/prefix:  animes_path
  # only when we submit a form is when we make a post request 
  def create  
    # @anime = Anime.new(anime_params)
    @anime = current_user.animes.build(anime_params)
    if @anime.save
      redirect_to animes_path #index for now
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
