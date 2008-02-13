# module Admin
#   class Posts < Application
#     self._layout = 'admin'
#     provides :html, :js
#   
#     def index
#       @posts = Post.all
#       render @posts
#     end
#   
#     def show(id)
#       @post = Post[id]
#       render @post
#   
#       rescue DataMapper::ObjectNotFoundError
#       raise NotFound unless @post
#     end
#   
#     def new
#       only_provides :html
#       @post = Post.new
#       render @post
#     end
#   
#     def create(post)
#       @post = Post.new(post)
#       if @post.save
#         redirect url(:admin_post, @post)
#       else
#         render :action => :new
#       end
#     end
#   
#     def edit(id)
#       only_provides :html
#       @post = Post[id]
#       render
#     
#       rescue DataMapper::ObjectNotFoundError
#       raise NotFound unless @post
#     end
#   
#     def update(id, post)
#       @post = Post[id]
#       if @post.update_attributes(post)
#         redirect url(:admin_post, @post)
#       else
#         raise BadRequest
#       end
#       rescue DataMapper::ObjectNotFoundError
#       raise NotFound unless @post
#     end
#   
#     def destroy(id)
#       @post = Post[id]
#       if @post.destroy!
#         redirect url(:admin_posts)
#       else
#         raise BadRequest
#       end
#       rescue DataMapper::ObjectNotFoundError
#       raise NotFound unless @post
#     end
#   end
# end