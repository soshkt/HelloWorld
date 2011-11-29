require 'spec_helper'

describe PeopleController do
  before (:each) do
    @person = Factory :lily
  end

  describe "routing" do
    it "should redirect to timeline" do
      get :show, :id => @person.id
      response.should redirect_to(timeline_person_url(@person))
    end

    it "should redirect to timeline with right param" do
      get :show, :id => @person.id, :v => "timeline"
      response.should redirect_to(timeline_person_url(@person))
    end

    it "should redirect to mapview with right param" do
      get :show, :id => @person.id, :v => "mapview"
      response.should redirect_to(mapview_person_url(@person))
    end

    it "should assigns the requested person as @person" do
      get :show, :id => @person.id
      assigns(:person).should eq(@person)
    end

    it "should assigns the requested person as @person in timeline" do
      get :timeline, :id => @person.id
      assigns(:person).should eq(@person)
    end

    it "should assigns the requested person as @person in mapview" do
      get :mapview, :id => @person.id
      assigns(:person).should eq(@person)
    end
  end
end
