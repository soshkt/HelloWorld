require 'spec_helper'

describe MiscController do

  describe "frontpage" do
    it "should be successful" do
      get 'frontpage'
      response.should be_success
    end
  end

  describe "GET 'setting'" do
    it "should be successful" do
      get 'setting'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "should have current person: lele" do
    @current_person.should == Person.find(35)
  end

end
