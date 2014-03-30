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
    params.each do |art_id, guess|
      if art_id.to_i > 0
        plain_guess = I18n.transliterate(guess).downcase
        plain_answer = I18n.transliterate(Artwork.find(art_id.to_i).artist.name).downcase
        if plain_guess == plain_answer
          @score +=1
        end
      end
    end
    @artworks = Artwork.where(:category => params[:gene])
  end

end
