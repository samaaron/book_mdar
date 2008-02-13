class Posts < Application
  provides :html#, :atom (TODO)
  
  def index
    @posts = Post.all(:order => 'created_at desc') #pagenation
    render @posts
  end
  
  def show(id)
    @post = Post[id]
    render @post
  
    rescue DataMapper::ObjectNotFoundError
    raise NotFound unless @post
  end
end