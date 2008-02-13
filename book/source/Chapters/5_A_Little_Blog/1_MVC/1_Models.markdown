## Models

### Getting started

Having discussed the functionality we can deduce that we will need the following models, Post, Comment, Tag, User and Image.

Merb has a model generator just as rails does:

    script/generate model post

This is make a post model for you, provided that you have defined an orm and the database simple_blog, in the previous steps.

When you run rake dm:db:auto_migrate, it will create the database table and all the properties, but take care this is a destructive method!

You can set the name of the database table in your model if it is called something different with:

    set_table_name 'list_of_posts'
    
This is only necessary if you are using an already existing database.

#### Properties

So DM models differ a bit from AR models as previously stated. Defining the database columns is achieved with the property method.

app/models/post.rb

    property :title,      :string,    :lazy => false
    
This is the title property of the post model. As we can see, the parameters are the name of the table column followed by the type and finally the options. 

Some of the available options are:

    :lazy         - Lazy load the specified property (:lazy => true).
    :default      - Specifies the default value
    :column       - Specifies the table column
    :nullable     - Can the value be null?
    :key          - Set as primary key
    :index        - Creates a database index for the column
    :accessor     - Set method visibility for the property accessors. Affects both
                    reader and writer. Allowable values are :public, :protected, :private.
    :reader       - Like the accessor option but affects only the property reader.
    :writer       - Like the accessor option but affects only the property writer.
    :protected    - Alias for :reader => :public, :writer => :protected
    :private      - Alias for :reader => :public, :writer => :private


#### Associations

Like AR, DM has associations which define relationships between models. Continuing with the Post model we can see a few of the associations defined:
    
    has_many :comments
    belongs_to :author, :class => 'User', :foreign_key => 'author_id'
    
You also can have the associations, has\_one and has\_and\_belongs\_to\_many (where you can specify the :join_table).
    
Pretty straight forward. A few things you should note however, you do not need to specify the foreign key as a property if it's defined in the association, and currently has\_one is implemented as has\_many (so it returns an array with one object instead of just the object itself, but this is will likely change!).

You also don't have to specify a relationship at all if you don't want to, as models can have one way relationships.

##### Polymorphic associations
http://pastie.textmate.org/private/mrvx3qmuagypwukrri9jq
(TODO) -polly assoc

##### Where is my has\_many :through?!
has\_many :through is in the pipes, but it is not currently available in DM. You could write your own methods, which mimicked that behaviour.
    
    (TODO) -example for hmthrough
 
#### Validation

(TODO) - custom validation, and vaildable gem

#### Callbacks

(TODO) list of available call backs


#### Migrations

(TODO) - maybe mention migrations

### CRUD

(TODO) -CRUD

#### Creating
To create a new record, just call the method new on a model and pass it your attributes.

    @post = Post.new(:title => 'My first post')
    
There is also an AR like method to find\_or\_create which attempts to find an object with the attributes provided, and creates the object if it cannot find it.

There is another way to create an object, which is to save it after the attributes have been set like this:
   
    @post = Post.new
    @post.attributes = {:name => 'Hi!',:body => 'This is just awesome!'}
    @post.save
    
#### Reading (aka finding)

The syntax for retrieving data from the database is clean an simple. As you can see with the following examples.

Finding a post with one as its primary key is done with the following:

    Post[1]
 
To get an array of all the records for the post model:

    Post.all

*NOTE*: you can also do Post.find(:all), like the AR syntax but this is just a synonym for Post.all

To get the first post, with the condition author = 'Matt':

    Post.first(:author => 'Matt')

When retrieving data the following parameters can be used:

    #   Posts.all :order => 'created_at desc'              # => ORDER BY created_at desc
    #   Posts.all :limit => 10                             # => LIMIT 10
    #   Posts.all :offset => 100                           # => OFFSET 100
    #   Posts.all :include => [:comments]

If the parameters are not found in these conditions it is assumed to be an attribute of the object.

You can also use symbol operators with the find to specify a condition, for example:

    Posts.all :title.like => '%welcome%', :created_at.lt => Time.now

This would return all the posts, where the tile was like 'welcome' and was created in the past.

Here is a list of the valid operators:

* gt    - greater than
* lt    - less than
* gte   - greater than or equal
* lte   - less than or equal
* not   - not equal
* like  - like
* in    - will be used automatically when an array is passed in as an argument
    
If you require a custom find, you can use sql with the method, find\_by\_sql. This will return an array of Structs (which are read-only) with the result of the query. 

##### Count

DM provides a count method to count the number of records of a model, you can also pass search conditions to count:

    comment_count = Post[1].comments.count
    
##### Each

(TODO) - Each

DataMapper sports an incredibly powerful each method with safely iterates over large quantities of rows in a table performing the block you pass in. Think of it like a Animal.find(:all).each {} block, but so much easier on your resources. Rather than instantiating all objects and then iterating over them, each works in batches and only instantiates a batch of results at a time, then iterates over items in the batch. Notice how you can pass it options just like a finder.

    1 Animal.each(:species => 'Mammal').each do |a|
    2   a.reproduce!
    3 end

#### Updating

    1 zoo.update_attributes(:name => 'Funky Town Municipal Zoo')


(TODO) - updating attributes
(TODO) - Dirty? only updates the changed attributes, so take note for virtual attrs

#### Destroying

You can destroy database records with the method destroy!, this work much like AR.
 
    bad_comment = Comment[6]
    bad_comment.destroy!
    
Should you want to delete all the records of a model, you can do the following:

    Comment.delete_all




