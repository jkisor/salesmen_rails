require 'spec_helper'

describe SalesGroupsController do
  describe 'GET new' do
    before { get :new }
    it 'instantiates a new sales group' do
      expect(assigns(:sales_group)).not_to be_nil
    end

    it 'renders the new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do 
    context 'with valid attributes' do
      let(:attributes) { attributes_for :sales_group }
      it 'saves new sales rep to database' do
        expect {
          post :create, sales_group: attributes
        }.to change(SalesGroup, :count).by 1
      end
      it 'redirects to sales rep index' do
        post :create, sales_group: attributes
        expect(response).to redirect_to SalesGroup.last
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_sales_group }
      it 'does not save new sales group' do
        expect {
          post :create, sales_group: invalid_attributes
        }.not_to change(SalesGroup, :count).by 1
      end
      it 'renders the new view' do 
        post :create, sales_group: invalid_attributes
        expect(response).to render_template :new 
      end  
    end
  end

  describe 'GET show' do
    let(:sales_group) { create :sales_group }
    before { get :show, id: sales_group.id }
    it 'finds the requested sales_group' do
      expect(assigns(:sales_group)).to eq sales_group
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET index' do
    let(:sales_group) { create :sales_group }
    before { get :index } 

    it 'populates array of sales groups' do
      expect(assigns(:sales_groups)).to eq [sales_group]
    end

    it 'renders the index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET edit' do
    let(:sales_group) { create :sales_group }
    before { get :edit, id: sales_group.id }
    it 'finds the requested sales group' do
      expect(assigns(:sales_group)).to eq sales_group
    end

    it 'renders the edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do
    let(:sales_group) { create :sales_group }
    context 'with valid attributes' do
      before do
        put :update, id: sales_group.id, sales_group: { description: 'Something different' }
      end
      it 'finds the requested sales rep' do
        expect(assigns(:sales_group)).to eq sales_group
      end

      it "changes the sales_reps' attributes" do
        sales_group.reload
        expect(sales_group.description).to eq 'Something different'
      end

      it 'redirects to the sales group index' do
        expect(response).to redirect_to sales_group
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_sales_group }
      before do
        put :update, id: sales_group.id, sales_group: invalid_attributes
      end
      it 'finds the requested sales rep' do
        expect(assigns(:sales_group)).to eq sales_group
      end

      it 'does not save the changes' do
        sales_group.reload
        expect(sales_group.description).not_to eq ' '
      end

      it 'renders the edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before { @sales_group = create :sales_group }
    it 'deletes the sales rep' do
      expect { delete :destroy, id: @sales_group.id 
        }.to change(SalesGroup, :count).by -1
    end

    it 'redirects to sales rep index' do
      delete :destroy, id: @sales_group.id
      expect(response).to redirect_to sales_groups_path
    end
  end
end
