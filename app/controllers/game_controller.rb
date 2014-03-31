class GameController < ApplicationController

  def index

  end

  def edit
    @artworks = Artwork.where(:category => params[:gene])
  end

  def update
    game = Game.new(params)
    @score_total = game.score_total
    @percent = game.percent
    @artworks = Artwork.where(:category => params[:gene])
  end

end
