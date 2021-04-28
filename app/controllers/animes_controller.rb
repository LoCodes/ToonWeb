class AnimesController < ApplicationController

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

  #route:       path/prefix:  
  def create 
  end 


  def show
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

end
