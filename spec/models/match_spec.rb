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
  
  context 'invalid score' do
    it 'should always have a player who scored 10' do
      match = build(:match, player_2_score: 8)
      match.valid?
      expect(match.errors[:base]).to eq ['Each match must have a winner.']
    end

    it 'should not be draw' do
      match = build(:match, player_1_score: 10)
      match.valid?
      expect(match.errors[:base]).to eq ['Game result should not be draw.']
    end
  end
end
