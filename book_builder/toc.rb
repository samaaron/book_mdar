module BookBuilder
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
         output << "#{'    '*(h.to_html.slice(2,1).to_i-1)}" # indentation at this header level
         output << "- [#{h.inner_text}](##{Book.dom_id_from(h.inner_text)})\n" # list entry with anchor
      end
      output
    end
  
    def to_plain_text
      
    end
  end
end
