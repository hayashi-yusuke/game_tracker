class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
    @current_session = @game.sessions.find_by(ended_at: nil)
  end

  def stats
    @game = Game.find(params[:id])
    @sessions = @game.sessions.where.not(ended_at: nil)
    @total_time = @sessions.sum { |session| session.ended_at - session.started_at}
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

private

  def game_params
    params.require(:game).permit(:name)
  end

end