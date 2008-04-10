# Creating an App

Right now that we've got all of that installed, time to create some test Merb application. Merb follows the same naming convention for projects that rails does, so 'my\_test\_app' and 'Test2' for example are valid names but 'T 3' is not, as they need to be valid SQL table names.

I like to keep my projects in different directories, so I have a different folder for my Merb apps and Rails apps (but it's up to you). So at the command line type:

    mkdir merb
    cd merb
    merb-gen app example_one
    
This will generate an empty Merb app, so lets go in and take a look. You'll notice that the directory structure is similar to Rails, with a few differences.

    # expected output
    RubiGen::Scripts::Generate
      create  app
      create  app/controllers
      create  app/helpers
      create  app/views
      create  app/views/exceptions
      create  app/views/layout
      create  autotest
      create  config
      create  config/environments
      create  public
      create  public/images
      create  public/stylesheets
      create  spec
      create  app/controllers/application.rb
      create  app/controllers/exceptions.rb
      create  app/helpers/global_helpers.rb
      create  app/views/exceptions/internal_server_error.html.erb
      create  app/views/exceptions/not_acceptable.html.erb
      create  app/views/exceptions/not_found.html.erb
      create  app/views/layout/application.html.erb
      create  autotest/discover.rb
      create  autotest/merb.rb
      create  autotest/merb_rspec.rb
      create  config/rack.rb
      create  config/router.rb
      create  config/init.rb
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/rake.rb
      create  config/environments/test.rb
      create  public/merb.fcgi
      create  public/images/merb.jpg
      create  public/stylesheets/master.css
      create  spec/spec.opts
      create  spec/spec_helper.rb
      create  /Rakefile



## Configuring Merb

Right so lets try and get the server running, before we do that you'll need to edit the init.rb 
file so un-comment the following lines (this is only necessary if you need to connect to a database, which we do in our case):

config/init.rb
    
    use_orm :data_mapper

    use_test :rspec
    
    Merb::BootLoader.before_app_loads do
        dependencies "RedCloth", "merb_helpers"
    end
          

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

      
Starting merb again shows everything is running ok.

You'll notice Merb runs on port 4000, but this can be changed with flag -p [port number]. More options can be found by typing:

    merb --help
    
You can even run merb with an application servers which supports rack (thin, evented_mongrel, fcgi, mongrel, and webrick):

    merb -a thin

