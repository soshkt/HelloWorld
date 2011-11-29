require 'spec_helper'

describe "photos/index.html.erb" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo),
      stub_model(Photo)
    ])
  end

  it "renders a list of photos" do
    render
  end
end
