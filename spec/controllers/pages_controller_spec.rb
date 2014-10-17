require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET 'front'" do
    it "returns http success" do
      get 'front'
      expect(response).to be_success
    end
  end

end
