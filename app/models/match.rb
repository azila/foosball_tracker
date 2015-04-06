class Match < ActiveRecord::Base
  belongs_to :player_1, class_name: 'Player', foreign_key: "player_1_id"
  belongs_to :player_2, class_name: 'Player', foreign_key: "player_2_id"

  validates :player_1_id, :player_2_id, :match_date, :player_1_score, :player_2_score, presence: true
  validates :player_1_score, inclusion: { in: 0..10 }
  validates :player_2_score, inclusion: { in: 0..10 }
end
