require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "new" do
    it "renders new template" do
      get "/"
      expect(response.body).to include("enter your url")
    end
  end

  describe "create" do
    it "creates a new url" do
      post "/urls", params: { url: { address: 'http://example.com' } }
      url = Url.last
      expect(url.token.size).to eq(5)
      expect(url.address).to eq('http://example.com')
    end
  end

  describe "show" do
    it "should redirect to url address" do
      url = Url.create(address: 'http://example.com')
      expect(RegisterViewJob).to receive(:perform_later).with(url.token)
      get "/#{url.token}"
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(url.address)
    end
  end

  describe "info" do
    it "should should url info" do
      url = Url.create(address: 'http://somehost.com/path')
      get "/#{url.token}/info"
      expect(response.body).to include(url.address)
      expect(response.body).to include("http://www.example.com/#{url.token}")
    end
  end
end
