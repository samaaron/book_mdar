class Posts < Application
  provides :html#, :atom (TODO)
  
  def index
    @posts = Post.latest
    render @posts
  end
  
  def show(id)
    @post = Post[id]
    render @post
  
    rescue DataMapper::ObjectNotFoundError
    raise NotFound
  end
end