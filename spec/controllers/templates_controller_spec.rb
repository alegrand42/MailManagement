require 'rails_helper'

RSpec.describe TemplatesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #generate' do
    context 'when template is valid' do
      it 'renders the page' do
        post :generate, session: { code: 'lorem ipsum', mail: 'so on' }
        expect(flash[:notice]).to match(/^Data Imported/)
      end
    end
  end
end
