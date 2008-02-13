# The Framework

Lets take a closer look at the directory structure that we've just created. I'll give brief overview of the framework here and go into further details of each component in subsequent chapters.

(TODO) - book:publish to add image
![Directory Stucture](dir.jpg)

The app folder contains your usual Models, Views and Controllers, Helpers. It also has Parts (they inherit from AbstractController), similar to the old Rails components, but are lightweight and are useful for sidebars, widgets etc. Mailers (which also inherit from the AbstractController) have their own folder where the controllers and views live. 

    app
      |--- controllers
      |--- models
      |--- helpers
      |--- mailers
      |--- helpers
      |--- parts
      |--- views

The config folder has all the configuration files and environments. It's important to edit the following files in here, dependencies.rb and database.yml before running Merb. The Merb router is defined here too, which map the incoming requests to the controllers (the syntax is not the same as Rails). 

    config
         \--- environments

Lib Folder contains extra stuff, not necessarily loaded on boot, need to add to dependencies. 

(TODO) - better lib desc, loading files etc
    
    lib
    
The Log directory contains logs, process id's.
    
    log
    
Public will hold all your assets, just like rails. 
    
    public
          \--- images
          \--- javascripts
          \--- stylesheets
    
Script contains the generators and scripts. Run script/generate --help to see what generators you have available. 
    
    script
    
Spec is for RSpec tests.
    
    spec
        \--- models
        \--- controllers
    
Test is for test/unit (same as Rails)
    
    test
        \--- unit
        
Gem is there so you can package gems with your application, as plug-ins are gems 
    
    gems
    
 
Unlike Rails there is no db, doc or vendor directory when generating an empty app.