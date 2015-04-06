class MatchesController < ApplicationController
  expose(:match)
  expose(:players)

  def new
  end

  def create
    self.match = Match.new(match_params)
    match.match_date = parse_date params[:match_date]
    if match.save
      redirect_to root_path, notice: 'Match was successfully created.'
    else
      render 'new'
    end
  end

  private
  def match_params
    params.require(:match).permit(:player_1_id, :player_2_id, :player_1_score, :player_2_score, :match_date)
  end

  def parse_date match_date
    Date.new(match_date[:year].to_i, match_date[:month].to_i, match_date[:day].to_i)
  end

end