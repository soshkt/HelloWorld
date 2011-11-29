require 'spec_helper'

describe "photos/edit.html.erb" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
    end
  end
end
