require 'spec_helper'

describe Person do
  describe "photos associations" do
    before (:each) do
      @lily = Person.create(:name => "lily", :email => "lily@gmail.com")
      @p1 = Factory :photo, :person => @lily
      @p2 = Factory :photo, :person => @lily
    end

    it "should have a photos attribute" do
      @lily.should respond_to :photos
    end

    it "should have the right photos in the right order" do
      @lily.photos.should == [@p1, @p2]
    end

  end
end
