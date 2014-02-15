require 'spec_helper'

describe LocationsController do
  describe 'GET new' do
    before { get :new }
    it 'creates new instance of location' do
      expect(assigns(:location)).not_to be_nil
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      let(:attributes) { attributes_for :location }
      it 'saves new location to database' do
        expect {
          post :create, location: attributes
        }.to change(Location, :count).by 1
      end
      it 'redirects to location index' do
        post :create, location: attributes
        expect(response).to redirect_to Location.last
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_location }
      it 'does not save submitted location' do
        expect {
          post :create, location: invalid_attributes
        }.not_to change(Location, :count).by 1
      end
      it 'renders the new view' do 
        post :create, location: invalid_attributes
        expect(response).to render_template :new 
      end  
    end
  end

  describe 'GET show' do
    let(:location) { create :location }
    before { get :show, id: location.id }
    it 'finds the requested location' do
      expect(assigns(:location)).to eq location
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET index' do
    let(:location) { create :location }
    before { get :index }
    it 'populates an array of locations' do
      expect(assigns(:locations)).to eq [location]
    end

    it 'renders the index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET edit' do
    let(:location) { create :location }
    before { get :edit, id: location.id }
    it 'finds the requested sales group' do
      expect(assigns(:location)).to eq location
    end

    it 'renders the edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do
    let(:location) { create :location }
    context 'with valid attributes' do
      before do
        put :update, id: location.id, location: { name: 'Something different' }
      end
      it 'finds the requested location' do
        expect(assigns(:location)).to eq location
      end

      it "changes the location's attributes" do
        location.reload
        expect(location.name).to eq 'Something different'
      end

      it 'redirects to the location index' do
        expect(response).to redirect_to location
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_location }
      before do
        put :update, id: location.id, location: invalid_attributes
      end
      it 'finds the requested location' do
        expect(assigns(:location)).to eq location
      end

      it 'does not save the changes' do
        location.reload
        expect(location.name).not_to eq ' '
      end

      it 'renders the edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'DELETE destroy' do
      before { @location = create :location }
      it 'deletes the location' do
        expect { delete :destroy, id: @location.id 
          }.to change(Location, :count).by -1
      end

      it 'redirects to location index' do
        delete :destroy, id: @location.id
        expect(response).to redirect_to locations_path
      end
    end
  end
end
