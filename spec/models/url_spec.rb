require 'rails_helper'

RSpec.describe Url, type: :model do
  it "should set a token to a new url" do
    url = Url.create(address: 'http://google.com')
    expect(url.token).to be_present
  end

  it "should not allow an invalid url address" do
    url = Url.create(address: "not valid")
    expect(url).not_to be_persisted
  end
end
