require 'rails_helper'

describe Match do
  it { should validate_presence_of :match_date }
  it { should validate_presence_of :player_1_id }
  it { should validate_presence_of :player_2_id }
  it { should validate_presence_of :player_1_score }
  it { should validate_presence_of :player_2_score }
  it { should validate_inclusion_of(:player_1_score).in_range(0..10) }
  it { should validate_inclusion_of(:player_2_score).in_range(0..10) }

  it { should belong_to(:player_1).class_name('Player') }
  it { should belong_to(:player_2).class_name('Player') }
end