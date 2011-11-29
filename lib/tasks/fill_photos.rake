require "nokogiri"
require "anemone"
require "rest_client"


task :fill_photos => :environment do
  photo_names = Photo.where(:user_id => 35).inject([]) {|arr, p| arr << p.filename }
  Anemone.crawl("http://www.douban.com/photos/photo/854208145/") do |anemone|
    url_like = /http:\/\/www.douban.com\/photos\/photo\/\d+\//
    path = "public/images/"
    anemone.on_pages_like(url_like) do |page|
      puts url = page.doc.css(".mainphoto > img").first['src']
      open(path + photo_names.shift + ".jpg", "wb") { |f| 
        f.write RestClient.get url
      }
      break if photo_names.blank?
    end
  end
end
