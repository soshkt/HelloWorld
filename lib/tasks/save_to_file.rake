require "rest_client"
task :save_to_file => :environment do
  path = "public/images/"
  full_file_path = path + filename
  open(full_file_path, "wb") { |f|
    f.write(RestClient.get "http://img3.douban.com/view/photo/photo/public/p1119513006.jpg")
  }
end
