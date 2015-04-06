class Player < ActiveRecord::Base
  has_many :lead_matches, class_name: 'Match', foreign_key: 'player_1_id'
  has_many :follow_matches, class_name: 'Match', foreign_key: 'player_2_id'

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, AvatarUploader
end
