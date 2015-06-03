require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do

  describe "GET #display" do
    it "returns http success" do
      get :display
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
