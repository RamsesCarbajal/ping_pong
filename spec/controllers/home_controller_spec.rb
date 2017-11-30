require 'spec_helper'
describe HomeController do
  describe "Get matches" do
    before(:each) do
      user = create(:user)
    end
    it "all players" do
      expect(described_class.new.history.count).to eq(History.all.count)
    end
  end
end
