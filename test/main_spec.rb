require 'VIDA'
require 'active_support/all'
describe "api" do
  it "should exist" do
    VIDA.new.class.should == VIDA
  end

  it "should get recent moments" do
    pending
    j = JSON.parse VIDA.new.call("moment/list_recent")
    j["result"].should == 0
  end

  describe "function about [moment]" do
    it "should get specific moments" do
      j = JSON.parse VIDA.new.call("moment/show/2737")
      j["data"]["name"].should == "LOMO\345\215\241"
    end

    it "should get the right page when query specific activity" do
      j = JSON.parse VIDA.new.call("moment/show/6558?page_size=8&offset_padding=0&activity_id=15277")
      j["current_page"].should == 1
    end

    it "should return the right page when query a page" do
      j = JSON.parse VIDA.new.call("moment/show/6558?page_size=8&offset_padding=0&page=1")
      j["current_page"].should == 1
    end

    it "should return moments a user owns" do
      o = {
        :attender => 134,
        :page => 0
      }
      j = JSON.parse VIDA.new.call("moment/list?#{o.to_param}")
      j.should == 0
    end
  end

  describe "function about [account]" do
    it "should let me login with weibo auth" do
      pending
      j = JSON.parse VIDA.new.call("account/signup_with_vendors", {:from => "weibo", :token => "06e0d3e5062b292e6102470c98435f13", :secret => "defb3121e95b237f694bf935ae8480a6"})
      j['result'].should == 0
      j['user']['id'].should == 134
    end
  end

  describe "function about [comment]" do
    pending
    it "should return 'result = 0' when success" do
      j = JSON.parse VIDA.new.call("comment/list", {:type => "Activity", :type_id => 14938})
      j['result'].should == 0
    end
    it "should list comment about the activity 14938" do
      j = JSON.parse VIDA.new.call("comment/list", {:type => "Activity", :type_id => 14938})
      j["data"][0]["commentable_id"].should == 14938
    end

    it "should post comment" do
      j = JSON.parse VIDA.new.call("comment/add", {:type => "Activity", :type_id => 4113, :content => "spec test#{Time.now}"}, {:token => "douban6648871", :secret => "05ctxe"})
      j["result"].should == 0
    end
  end

  describe "function about like" do
    pending
    it "should like a activity" do
      j = JSON.parse VIDA.new.call("moment/like", {:activity_id => 4113}, {:token => "douban6648871", :secret => "05ctxe"})
      j["result"].should == 0
    end
  end

  describe "function about session" do
    pending
    it "should sign up" do
      j = JSON.parse VIDA.new.call("account/signup_with_vendors", {:from => "weibo", :token => "322a1c29c0c5b2bfe4934177299f09a6", :secret => "cda6c5b7e01ee4f5c8f5b5b3b080ec44"})
      j['result'].should == 0
      j['user']['id'].should == 6693
    end
  end

  describe "function about user" do
    it "should return the earliest moment the user created" do
      j = JSON.parse VIDA.new.call("user/show", {:id => 128})
      i = Time.parse j['data']['first_moment_created_at']
      str = ''
      while i <= Time.current.end_of_month do
        str += i.month.to_s
        i = i.next_month
      end
      str.should == ""
    end
  end
end
