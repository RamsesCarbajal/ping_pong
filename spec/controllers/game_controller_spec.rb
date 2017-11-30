require 'rails_helper'

RSpec.describe GameController, type: :controller do
  describe "create game" do
    describe  'fail' do
      it 'invalid params' do
        game = described_class.new
        game.params = ActionController::Parameters.new({})
        expect { game.match }.to raise_error(Exception, "invalid arguments") 
      end
      it 'no one win' do
        user1 = create(:user)
        user2 = create(:user)
        game = described_class.new
        game_params = {
          game: {
            player_one: user1.id,
            player_two: user2.id,
            score_one:  20, 
            score_two:  20
        }}
     
        game.params = ActionController::Parameters.new(game_params)
        expect { game.match }.to raise_error(Exception, "no one win") 
        
       
      end
    end
    describe 'success' do
      it 'valid match' do
        user1 = create(:user)
        user2 = create(:user)
        game = described_class.new
        game_params = {
          game: {
            player_one: user1.id,
            player_two: user2.id,
            score_one:  23, 
            score_two:  20
        }}

        game.params = ActionController::Parameters.new(game_params)
        game.match
        review_game = Game.last

        expect(game_params[:game][:player_one]).to eq(review_game.player_one)
      end
    end

  end
end
