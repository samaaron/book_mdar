%W(rubygems rake fileutils BlueCloth hpricot erb).each { |pkg| require pkg }



namespace :book do
  desc "compile files from the current directory and publish to all available formats"
  task :publish do
    html()
    plain_text()
    log 'Done!'
  end
  
  desc "Outstanding TODO's"  
  task :todo do
    system('grep --exclude=\*.svn\* -hr TODO book/source/')
  end

  namespace :publish do
    desc "compile files from the current directory into html"
    task :html do
      log 'Publishing HTML...'
      html
      log 'Done!'
    end
  
    desc "compile files from the current directory into pain text"
    task :text do
      log 'Publishing plain text...'
      plain_text
      log 'Done!'
    end
  end
  
  desc "prepare a structure for publishing to"
  task :prepare do
    log 'Preparing a publsiing structure...'
    book = default_book
    book.prepare!
    log 'Done!'
  end
end

# crate an html output
def html
  book = default_book
  log 'Processing HTML format...'
  book.html!
end

# crate a plain text output
def plain_text
  book = default_book
  log 'Processing Plain Text format...'
  book.plain_text!
end


# this is here as a helper so we can send messages somewhere other than stdout at a later date if we want to.
def log(msg='')
  puts msg
end

def default_book
  BookBuilder::Book.new('merb_book','./book/', :markdown)
end

# some helper classes to do all the heavy lifting.
module BookBuilder
  class Book
    def initialize(name="Book",root_path="./",format="*")
      @name = name
      @format = format
      @root_path = root_path
      @files = FileFinder.new("#{@root_path}source/",format)
    end
    
    def html
      render(:html)
    end
    
    def html!
      save!(self.html,:html)
    end
    
    def plain_text
      render(:txt)
    end
  
    def plain_text!
      save!(self.plain_text,:txt)
    end
    
    def render(format)
      template = ERB.new File.open("#{@root_path}templates/#{@name}.#{format}.erb",'r') { |f| f.read }
      template.result(binding)
    end
    
    def save!(txt,format=:txt)
      output_file = "#{@root_path}output/#{@name}.#{format}"
      FileUtils.touch(output_file)
      File.open(output_file,'w') { |file| file << txt }
    end
    
    def parse_body_to(format=:plain_text)
      send(:"#{@format}_to_#{format}",body)
    end
    
    def markdown_to_html(text='')
      text = text.to_markdown if text.respond_to? :to_markdown
      BlueCloth::new(text).to_html
    end
    
    def markdown_to_plain_text(text='')
      text.to_markdown if text.respond_to? :to_markdown
      text
    end
    
    def body
      @files.merged_contents
    end
    
    def toc
      ''
      Toc.from_html(parse_body_to(:html)).send(:"to_#{@format}")
    end
    
    def parse_toc_to(format=:plain_text)
      send(:"#{@format}_to_#{format}",toc)
    end
    
    def prepare!
      if File.exists? @root_path
        puts "Skipping... '#{@root_path}' already exists"
      else
        FileUtils.mkdir_p(@root_path)
        puts "Created... '#{@root_path}'"
      end
      FileUtils.cd(@root_path)
      %w( output templates source ).each do |dir|
        if File.exists? dir
          puts "Skipping... '#{@root_path}#{dir}' already exists"
        else
          FileUtils.mkdir(dir)
          puts "Created... '#{@root_path}#{dir}'"
        end
      end
      FileUtils.cd("./templates/")
      templates = supported_formats.map { |f| "#{@name}.#{f}.erb" }
      templates.each do |template|
        if File.exists? template
          puts "Skipping... '#{@root_path}templates/#{template}' already exists"
        else
          FileUtils.touch(template)
          puts "Created... '#{@root_path}templates/#{template}'"
        end
      end
    end
    
    def supported_formats
      [:html,:txt]
    end
  end
  
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
  
  class Toc
    def initialize(html=" ")
      @html = html
    end
    
    def self.from_html(html)
      new(html)
    end
    
    def doc(refresh=false)
      @doc = nil if refresh
      @doc ||= Hpricot(@html)
    end
    
    def headers_at_level(level=1)
      results = []
      (doc/"h#{level}").each { |h| results << h.inner_text }
      results
    end
    
    def book_title
      headers_at_level(1).first
    end
    
    def each_header_tree_node(&block)
      uid = 1
      doc.traverse_element('h1', 'h2', 'h3', 'h4', 'h5', 'h6' ) { |h| yield(h,uid); uid+=1}
    end
    
    def to_markdown
      output = "#{book_title}\n"
      output << "=================================================\n\n"
      each_header_tree_node do |h,uid| 
        output << "#{'    '*(h.to_html.slice(2,1).to_i-1)}" # indentation at this heade level
        output << "- [#{h.inner_text}](#contents_anchor_#{uid})\n" # list entry with anchor
      end
      output
    end
    
    def to_plain_text
      
    end
  end
end



