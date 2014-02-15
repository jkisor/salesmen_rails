require 'spec_helper'

describe SalesRepsController do
  describe 'GET new' do
    before { get :new }
    it 'assigns a new sales rep to @sales_rep' do
      expect(assigns(:sales_rep)).not_to be_nil
    end

    it 'renders the new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      let(:attributes) { attributes_for :sales_rep }
      it 'saves new sales rep to database' do
        expect {
          post :create, sales_rep: attributes
        }.to change(SalesRep, :count).by 1
      end
      it 'redirects to sales rep index' do
        post :create, sales_rep: attributes
        expect(response).to redirect_to SalesRep.last
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_sales_rep }
      it 'does not save new sales rep' do
        expect {
          post :create, sales_rep: invalid_attributes
        }.not_to change(SalesRep, :count).by 1
      end
      it 'renders the new view' do 
        post :create, sales_rep: invalid_attributes
        expect(response).to render_template :new 
      end  
    end
  end

  describe 'GET show' do
    let(:sales_rep) { create :sales_rep }
    before { get :show, id: sales_rep.id }
    it 'finds the requested sales rep' do
      expect(assigns(:sales_rep)).to eq sales_rep
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET index' do
    let(:sales_rep) { create :sales_rep }
    before { get :index } 

    it 'populates array of sales rep' do
      expect(assigns(:sales_reps)).to eq [sales_rep] 
    end

    it 'renders the index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET edit' do
    let(:sales_rep) { create :sales_rep }
    before { get :edit, id: sales_rep.id }
    it 'finds the requested sales rep' do
      expect(assigns(:sales_rep)).to eq sales_rep
    end

    it 'renders the edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do
    let(:sales_rep) { create :sales_rep }
    context 'with valid attributes' do
      before do
        put :update, id: sales_rep.id, sales_rep: {first_name: 'Different', last_name: 'Name'}
      end
      it 'finds the requested sales rep' do
        expect(assigns(:sales_rep)).to eq sales_rep
      end

      it "changes the sales_reps' attributes" do
        sales_rep.reload
        expect(sales_rep.full_name).to eq 'Different Name'
      end

      it 'redirects to the sales_rep index' do
        expect(response).to redirect_to sales_rep
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for :invalid_sales_rep }
      before do
        put :update, id: sales_rep.id, sales_rep: invalid_attributes
      end
      it 'finds the requested sales rep' do
        expect(assigns(:sales_rep)).to eq sales_rep
      end

      it 'does not save the changes' do
        sales_rep.reload
        expect(sales_rep.first_name).not_to eq ' '
        expect(sales_rep.last_name).not_to eq ' '
      end

      it 'renders the edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before { @sales_rep = create :sales_rep }
    it 'deletes the sales rep' do
      expect { delete :destroy, id: @sales_rep.id 
        }.to change(SalesRep, :count).by -1
    end

    it 'redirects to sales rep index' do
      delete :destroy, id: @sales_rep.id
      expect(response).to redirect_to sales_reps_path
    end
  end
end


