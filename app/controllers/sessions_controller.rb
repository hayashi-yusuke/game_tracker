class SessionsController < ApplicationController

  def create
    @session = Session.new(game_id: params[:game_id], started_at: Time.current)
    @session.save
  end

  def update
    @session = Session.find(params[:id])
    @session.update(ended_at: Time.current)
  end
  
end
