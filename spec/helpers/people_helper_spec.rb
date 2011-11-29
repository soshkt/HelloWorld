require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PeopleHelper. For example:
#
# describe PeopleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PeopleHelper do
  it "should return 5 empty item" do
    empty_timeline_items(5).should == '<span class="timeline_item"></span>' * 5
  end
end
