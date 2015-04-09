class Player < ActiveRecord::Base
  has_many :lead_matches, class_name: 'Match', foreign_key: 'player_1_id'
  has_many :follow_matches, class_name: 'Match', foreign_key: 'player_2_id'

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, AvatarUploader
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def total_games
    lead_matches + follow_matches
  end

  def wins
    Match.lead_wins(self.id) + Match.follow_wins(self.id)
  end

  def defeats
    Match.lead_defeats(self.id) + Match.follow_defeats(self.id)
  end

  def average
    lead_matches.sum(:player_1_score) + follow_matches.sum(:player_2_score)
  end
end
