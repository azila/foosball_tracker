class PlayersController < ApplicationController
  expose(:player)
  expose(:players)

  def index
  end

  def show
  end

  def new
  end

  def create
    self.player = Player.new(player_params)
    if player.save
      redirect_to players_path, notice: 'Player was successfully created.'
    else
      render 'new'
    end
  end

  private 
  def player_params
    params.require(:player).permit(:first_name, :last_name, :avatar)
  end
end