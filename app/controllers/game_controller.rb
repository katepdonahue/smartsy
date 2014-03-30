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
    binding.pry
    @artworks = Artwork.where(:category => params[:gene])
  end

end
