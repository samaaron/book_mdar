# Creating an App

Right now that we've got all of that installed, time to create some test Merb application. Merb follows the same naming convention for projects that rails does, so 'my\_test\_app' and 'Test2' for example are valid names but 'T 3' is not, as they need to be valid SQL table names.

I like to keep my projects in different directories, so I have a different folder for my Merb apps and 
Rails apps (but it's up to you). So at the command line type:

    mkdir merb
    cd merb
    merb example_one
    
This will generate an empty Merb app, so lets go in and take a look. You'll notice that the directory structure is similar to Rails, with a few differences.

    # expected output
    create  
    create  app/controllers
    create  app/models
    create  app/helpers
    create  app/mailers/helpers
    create  app/mailers/views/layout
    create  app/parts/helpers
    create  app/parts/views/layout
    create  app/views/layout
    create  app/views/exceptions
    create  config/environments
    create  lib
    create  log
    create  public/images
    create  public/javascripts
    create  public/stylesheets
    create  script
    create  spec/models
    create  spec/controllers
    create  test/unit
    create  gems
    create  Rakefile
    create  app/controllers/application.rb
    create  app/controllers/exceptions.rb
    create  app/helpers/global_helper.rb
    create  app/parts/views/layout/application.html.erb
    create  app/mailers/views/layout/application.html.erb
    create  app/mailers/views/layout/application.text.erb
    create  app/views/layout/application.html.erb
    create  app/views/exceptions/internal_server_error.html.erb
    create  app/views/exceptions/not_found.html.erb
    create  app/views/exceptions/not_acceptable.html.erb
    create  public/images/merb.jpg
    create  public/stylesheets/master.css
    create  public/merb.fcgi
    create  config/boot.rb
    create  config/merb_init.rb
    create  config/router.rb
    create  config/upload.conf
    create  config/dependencies.rb
    create  config/environments/development.rb
    create  config/environments/production.rb
    create  config/environments/test.rb
    create  spec/spec_helper.rb
    create  test/test_helper.rb
    create  config/merb.yml
    create  script/stop_merb
    create  script/generate
    create  script/destroy
    

    
## Configuring Merb

Right so lets try and get the server running, before we do that you'll need to edit the dependencies.rb 
file so un-comment the following lines (this is only necessary if you need to connect to a database):

config/dependencies.rb
    
    use_orm :data_mapper

    use_test :rspec

    dependencies "RedCloth", "merb_helpers"
      

Typing merb now in your command line will try and start the server.

    Started merb_init.rb ...
    No database.yml file found in /Users/work/merb/t/example_one/config.
    A sample file was created called database.sample.yml for you to copy and edit.

As you can see, we forgot to set up the database. A sample file has kindly been generated for us. 
So create a database.yml file a bit like this one (remember to create the database you specify):

    # This is a sample database file for the DataMapper ORM
    :development:
      :adapter: mysql
      :database: test
      :username: root
      :password: 
      :host: localhost

      
Starting merb again shows everything is running ok:

    Merb started with these options:
    --- 
    :exception_details: true
    :query_string_whitelist: []

    :port: "4000"
    :environment: development
    :session_secret_key: /USERS/WORK/BOOK/MERB_BOOK/CODE/EXAMPLE_ONE2400
    :reloader_time: 0.5
    :host: 0.0.0.0
    :mongrel_x_sendfile: true
    :reloader: true
    :cache_templates: false
    :use_mutex: true
    :merb_root: /Users/work/book/merb_book/code/example_one
    :session_id_cookie_only: true

    Started merb_init.rb ...
    Connecting to database...
    Loading Application...
    Compiling routes..
    Loaded DEVELOPMENT Environment...
    Not Using Sessions

You'll notice Merb runs on port 4000, but this can be changed with flag -p [port number]. More options can be found by typing:

    merb --help

