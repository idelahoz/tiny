require 'rails_helper'

RSpec.describe RegisterViewJob, type: :job do
  describe "perform" do
    it "should increase visits" do
      url = Url.create(address: 'http://9gag.com')
      expect { RegisterViewJob.perform_now(url.token) }.to change { url.reload.visits }.from(0).to(1)
    end
  end
end
