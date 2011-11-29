#encoding: utf-8
require 'spec_helper'

describe "misc request", :type => :request do
  describe "GET /photos" do
    it "see lele's lifestream" do
      visit('/')
      click_link('查看VIDA乐乐的生活轨迹')
    end
  end
end
