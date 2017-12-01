class Game < ActiveRecord::Base
  after_save :update_rank
  def update_rank
    player1 = History.where(user_id: self.player_one).first
puts player1.inspect
    player1.score = player1.score + self.score_one
    player1.save
    player2 = History.where(user_id: self.player_two).first
    player2.score = player2.score + self.score_two
    player2.save
  end
end
