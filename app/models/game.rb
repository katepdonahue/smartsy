class Game
  attr_accessor :total, :score
  attr_reader :params

  def initialize(params)
    @params = params
    @score = 0
    @total = 0
  end

  def score_total
    params.each do |art_id, guess|
      if art_id.to_i > 0
        self.total +=1
        plain_guess = I18n.transliterate(guess).downcase
        plain_answer = I18n.transliterate(Artwork.find(art_id.to_i).artist.name).downcase
        if plain_guess == plain_answer
          self.score +=1
        end
      end
    end
    "#{score}/#{total}"
  end

  def percent
    ((self.score.to_f/self.total.to_f) * 100.0).round(2)
  end


end