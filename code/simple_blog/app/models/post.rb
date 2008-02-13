class Post < DataMapper::Base
  #(TODO) add permalinks/slugs
  has_many :comments
  # has_many :tags
  #has_many :images (could use has_one but they are implemented the same atm)
  #belongs_to :author, :class => 'User', :foreign_key => 'author_id' (not implemented yet)
  
  property :title,      :string,    :lazy => false
  # property :body_html,  :text,      :lazy => false
  property :body,       :text

  property :created_at, :datetime
  property :updated_at, :datetime
    
  validates_presence_of :title
  
  def self.latest
    self.all(:order => 'created_at desc')
  end
  
  def body_html
    RedCloth.new(self.body).to_html
  end
end

