require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "new" do
    it "renders new template" do
      get "/urls/new"
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
end
