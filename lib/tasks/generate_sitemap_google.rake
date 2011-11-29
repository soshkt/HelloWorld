desc "Generate xml for sitemap_google" 
task :generate_sitemap_google => :environment do
	
	ENTRIES_PER_XML = 50000
  HOST = "http://vida.fm"
  ROOT_PATH = "./public"
	
  File.open("#{ROOT_PATH}/sitemap_google_index.xml", 'w') do |file|
    file.puts'<?xml version="1.0" encoding="UTF-8"?>'
    file.puts'<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
    moments = Moment.all
    p_c = moments.size / ENTRIES_PER_XML + 1
    moment_ids = moments.collect {|x| x.id}
    for i in 1...p_c + 1
    	filename = "sitemap_moment_#{i}.xml"
			output_file(filename, '/moments/', 0.8, moment_ids[ENTRIES_PER_XML * (i - 1)..ENTRIES_PER_XML * (i) - 1])
			file.puts'<sitemap>'
			file.puts"<loc>#{HOST}/#{filename}</loc>"
			file.puts"<lastmod>#{DateTime.now}</lastmod>"
			file.puts'</sitemap>'
  	end
  	
    file.puts'</sitemapindex>'
  end
end

def output_file(filename, act, pri, ids)
	File.open("#{ROOT_PATH}/#{filename}", 'w') do |file|
    file.puts'<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
    for i in ids
	    file.puts'<url>'
	    file.puts "<loc>#{HOST}#{act}#{i}</loc>"
	    file.puts"<priority>#{pri}</priority>"
	    file.puts'<changefreq>daily</changefreq>'
	    file.puts'</url>'
  	end
    file.puts'</urlset>'
	end	
end
