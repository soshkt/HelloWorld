require 'spec_helper'

describe InvitationController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'oops'" do
    it "should be successful" do
      get 'oops'
      response.should be_success
    end
  end

  describe "GET 'choose'" do
    it "should be successful" do
      get 'choose'
      response.should be_success
    end
  end

end
