class MatchesController < ApplicationController
  expose(:match)
  expose(:players)
  expose(:matches)

  def index
  	self.matches = Match.paginate(page: params[:page], per_page: 7)
  end

  def new
  end

  def create
    self.match = Match.new(match_params)
    if match.save
      redirect_to matches_path, notice: 'Match was successfully created.'
    else
      render 'new'
    end
  end

  private
  
  def match_params
    params.require(:match).permit(:player_1_id, :player_2_id, :player_1_score, :player_2_score, :match_date)
  end
end