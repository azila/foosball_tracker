class Match < ActiveRecord::Base
  belongs_to :player_1, class_name: 'Player', foreign_key: "player_1_id"
  belongs_to :player_2, class_name: 'Player', foreign_key: "player_2_id"

  validates :player_1_id, :player_2_id, :match_date, :player_1_score, :player_2_score, presence: true
  validates :player_1_score, :player_2_score, inclusion: { in: 0..10 }
  validate :not_same_player
  validate :always_one_winner
  validate :not_draw

  private
  def not_same_player
    errors.add(:base, 'First player should not be the same as second.') if player_1_id == player_2_id
  end

  def always_one_winner
    errors.add(:base, 'Each match must have a winner.') unless player_1_score == 10 or player_2_score == 10
  end

  def not_draw
    errors.add(:base, 'Game result should not be draw.') if player_1_score == player_2_score
  end
end
