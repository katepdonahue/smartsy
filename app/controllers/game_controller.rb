class GameController < ApplicationController

  def index

  end

  def edit
    @artworks = Artwork.where(:category => params[:gene])
  end

  def update
    @score = 0
    @total = 0
    params.each do |art_id, guess|
      if art_id.to_i > 0
        @total +=1
        plain_guess = I18n.transliterate(guess).downcase
        plain_answer = I18n.transliterate(Artwork.find(art_id.to_i).artist.name).downcase
        if plain_guess == plain_answer
          @score +=1
        end
      end
    end
    @percent = ((@score.to_f / @total.to_f) * 100.0).round(2)
    @artworks = Artwork.where(:category => params[:gene])
  end

end
