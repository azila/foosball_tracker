require 'rails_helper'

describe PlayersController do

  describe 'GET index' do
  	it 'exposes all players' do
      player = create(:player)
      get :index, {}
      expect(controller.players).to eq([player])
    end
  end

  describe 'GET show' do
    it 'exposes the requested player' do
      player = create(:player)
      get :show, { id: player.id }
      expect(controller.player).to eq(player)
    end
  end

  describe 'GET new' do
    it 'exposes a new player' do
      get :new, {}
      expect(controller.player).to be_a_new(Player)
    end
  end

  describe 'POST create' do
  	let(:player) { build(:player) }
    
    describe 'with valid params' do
      it 'creates a new Player' do
        expect {
          	post :create, {player: { 'first_name': player.first_name, 'last_name': player.last_name } }
        }.to change(Player, :count).by(1)
      end

      it 'redirects to the created player' do
        post :create, { player: { 'first_name': player.first_name, 'last_name': player.last_name } }
        expect(response).to redirect_to(players_path)
      end
    end

    describe 'with invalid params' do
      it 'exposes a newly created but unsaved category' do
        Player.any_instance.stub(:save).and_return(false)
        post :create, {player: { 'first_name': '' } }
        expect(controller.player).to be_a_new(Player)
      end

      it "re-renders the 'new' template" do
        Player.any_instance.stub(:save).and_return(false)
        post :create, {player: { 'first_name': '' } }
        expect(response).to render_template('new')
      end
    end
  end
end