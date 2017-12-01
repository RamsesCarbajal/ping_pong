class GameController < ApplicationController
  def match
    @game = Game.new
    if params[:game]
      @game.player_one = params[:game][:player_one].to_i
      @game.player_two = params[:game][:player_two].to_i
      @game.score_one  = params[:game][:score_one].to_i
      @game.score_two  = params[:game][:score_two].to_i
    end
     
    validate_match
    analize_match 
    redirect_to :controller => 'home', :action => 'history'
  end
  
  def index
    @game = Game.new
  end

  def analize_match

    game_params = nil
    if valid_score_to_win(@game[:score_one], @game[:score_two])
      game_params = {
        winer:        @game[:player_one],
        score_winer:  @game[:score_one],
        losser:       @game[:player_two],
        score_losser: @game[:score_two]
      }
    elsif valid_score_to_win(@game[:score_two], @game[:score_one])
      game_params = {
        winer:        @game[:player_two],
        score_winer:  @game[:score_two],
        losser:       @game[:player_one], 
        score_losser: @game[:score_one]
      }
    else
      game_params = nil
    end 
    raise Exception , 'no one win' if game_params.nil?
    create_game(game_params)
    
  end

  def create_game(game_params)
    game = Game.new
    game.player_one = game_params[:winer]
    game.score_one  = game_params[:score_winer]
    game.player_two = game_params[:losser]
    game.score_two  = game_params[:score_losser]
    game.save

  end

  def validate_match

    if @game[:player_one].nil? || @game[:player_two].nil? || 
        @game[:score_one].nil? || @game[:score_two].nil?
      raise Exception , 'invalid arguments'
    end
  end

  def valid_score_to_win( score_one, score_two)
    return true if score_one > 21 && (score_one - score_two) > 2
    false
  end
end
