# module Admin
#   class Comments < Application
#     provides :html, :js
# 
#     def index
#       @comments = Comment.all
#       render @comments
#     end
# 
#     def show(id)
#       @comment = Comment[id]
#       raise NotFound unless @comment
#       render @comment
#     end
# 
#     def new
#       only_provides :html
#       @comment = Comment.new
#       render @comment
#     end
# 
#     def create(comment)
#       @comment = Comment.new(comment)
#       if @comment.save
#         redirect url(:comment, @comment)
#       else
#         render :action => :new
#       end
#     end
# 
#     def edit(id)
#       only_provides :html
#       @comment = Comment[id]
#       raise NotFound unless @comment
#       render
#     end
# 
#     def update(id, comment)
#       @comment = Comment[id]
#       raise NotFound unless @comment
#       if @comment.update_attributes(comment)
#         redirect url(:comment, @comment)
#       else
#         raise BadRequest
#       end
#     end
# 
#     def destroy(id)
#       @comment = Comment[id]
#       raise NotFound unless @comment
#       if @comment.destroy!
#         redirect url(:comments)
#       else
#         raise BadRequest
#       end
#     end
#   end
# end