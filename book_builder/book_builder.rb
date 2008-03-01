# add to the load path
$LOAD_PATH.unshift File.dirname(__FILE__)

# require dependancies
%W(rubygems rake fileutils BlueCloth hpricot erb).each do |pkg| 
  begin
    require pkg 
  rescue LoadError => e 
    raise "You need to install #{pkg}" 
  end
end

# require book builder files
%W(book file_finder toc).each do |file| 
  begin
    require file 
  rescue LoadError => e 
    raise "Cannot run, missing file #{file}" 
  end
end