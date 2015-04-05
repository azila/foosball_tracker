class Player < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, AvatarUploader
end