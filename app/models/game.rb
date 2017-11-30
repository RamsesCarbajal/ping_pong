class Game < ActiveRecord::Base
  after_save :update_rank
  def update_rank
    player1 = History.find(self.player_one)
    player1.score = player1.score + self.score_one
    player1.save
    player2 = History.find(self.player_two)
    player2.score = player2.score + self.score_two
    player2.save
  end
end
