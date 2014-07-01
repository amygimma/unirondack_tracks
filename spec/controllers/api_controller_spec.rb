require 'spec_helper'

describe ApiController do

  describe "GET 'campers'" do
    it "returns http success" do
      get 'campers'
      response.should be_success
    end
  end

end
