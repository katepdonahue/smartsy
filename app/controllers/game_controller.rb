class GameController < ApplicationController

  def index

  end

  def show
    @artworks = Artwork.where(:category => params[:gene])
  end

  def edit
    @artworks = Artwork.where(:category => params[:gene])
  end

  def update
    @score = 0
    @artworks = Artwork.where(:category => params[:gene])
  end

end
