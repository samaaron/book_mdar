## Views

(TODO) - form helpers
(TODO) - mention you can use other template languages

### Partials

Use the partial method to render a partial from the current directory. If you pass a hash as the second argument the contents will be made available as local variables in the partial.

    partial :post, {:comments => @post.comments}

To display the latest posts on our blog's front page, we use the :with and :as arguments to render a collection.

    partial :post, :with => @posts, :as => post