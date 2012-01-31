task :compress do
  FileList["*.png"].each do |f|
    `convert #{f} #{File.basename(f, ".png") + '.jpg'}`
  end
end
