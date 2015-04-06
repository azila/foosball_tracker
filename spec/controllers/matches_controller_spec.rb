require 'rails_helper'

describe MatchesController do

  describe 'GET index' do
  	it 'exposes all matches' do
      match = create(:match)
      get :index, {}
      expect(controller.matches).to eq([match])
    end
  end

  describe 'GET new' do
    it 'exposes a new match' do
      get :new, {}
      expect(controller.match).to be_a_new(Match)
    end
  end

  describe 'POST create' do
    let(:match) { build(:match) }
    let(:player_1) { create(:player, id: 1) }
    let(:player_2) { create(:player, id: 2) }
    
    describe 'with valid params' do
      it 'creates a new Match' do
        expect {
            post :create, { match: { 'player_1_id': player_1.id, 
                                      'player_2_id': player_2.id,
                                      'player_1_score': match.player_1_score,
                                      'player_2_score': match.player_2_score,
                                      'match_date': match.match_date } 
                                    }
        }.to change(Match, :count).by(1)
      end

      it 'redirects to the created match' do
        post :create, { match: { 'player_1_id': player_1.id, 
                                'player_2_id': player_2.id,
                                'player_1_score': match.player_1_score,
                                'player_2_score': match.player_2_score,
                                'match_date': match.match_date } 
                              }
        expect(response).to redirect_to(matches_path)
      end
    end

    describe 'with invalid params' do
      it 'exposes a newly created but unsaved match' do
        Match.any_instance.stub(:save).and_return(false)
        post :create, { match: attributes_for(:match) }
        expect(controller.match).to be_a_new(Match)
      end

      it "re-renders the 'new' template" do
        Match.any_instance.stub(:save).and_return(false)
        post :create, { match: attributes_for(:match) }
        expect(response).to render_template('new')
      end
    end
  end
end