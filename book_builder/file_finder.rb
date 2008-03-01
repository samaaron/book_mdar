module BookBuilder
  class FileFinder < Array
    def initialize(root_path, format)
      @format = format.to_s
      @root = root_path.to_s
      super(Dir["#{@root}**/*.#{@format}"].entries)
    end
  
    def contents
      self.map do |path| 
        File.open(path,'r') { |f| f.read } 
      end
    end
  
    def merged_contents
      self.contents.inject('') { |merged,content| merged << content << "\n" }
    end
  end
end