require 'rails_helper'

RSpec.describe 'Main Page', type: :request do
  describe 'GET #main_page' do
    before { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'main_page' template" do
      expect(response).to render_template('main_page')
    end
    it 'have the right text' do
      expect(response.body).to include('Parrotscan')
    end
  end
end
