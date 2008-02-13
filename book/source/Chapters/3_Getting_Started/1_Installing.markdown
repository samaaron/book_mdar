# Getting Started

Before we get started I'm going to assume you have the following installed:

* [Ruby](http://www.ruby-lang.org/) 
* A DBMS (we'll use [MySQL](http://mysql.org/))
* [SVN](http://subversion.tigris.org/) and [git](http://git.or.cz/) (if you want to get the source code)


## Installing Merb

If you just want to play around with Merb grab the gem:
    
    sudo gem install merb -y
    
*Windows users see [this post](http://www.ghostonthird.com/2007/11/17/merb-on-windows-it-works/) for the install instructions.*
    
On the other hand if you want to get down and dirty it's best to grab the source code from trunk 
and you'll need to install the following gems:

    sudo gem install mongrel json_pure erubis mime-types rspec hpricot \
        mocha rubigen haml markaby mailfactory ruby2ruby -y

    (TODO) - git repo for merb trunk 
    svn co http://svn.devjavu.com/merb/trunk merb && cd merb && rake install

Take note that if you need to use JSON you should install the json gem, json_pure is used so merb will install on JRuby.

Merb is ORM agnostic, but as the title of this book suggests we'll be using Datamapper.
Should you want to stick with ActiveRecord or play with Sequel, check the [merb documentation](http://merb.rubyforge.org/files/README.html) for install instructions.

## Installing Datamapper

    sudo gem install merb_datamapper
    sudo gem install data_objects
    sudo gem install do_mysql || do_sqlite3 || do_postgres

You need to install the correct database adaptor for the database you are using. I'll use MySQL, 
but you can use any of the above. If you get the following error message, 'Cannot find mysql_config in 
your path', then you need to add your MySQL bin directory to your path or you can run this is the command:

    sudo env PATH=/usr/local/mysql/bin:$PATH gem install pkg/ 
    do_mysql-0.2.2.gem -- --with-mysql-dir=/usr/local/mysql

    # If updating the gem:
    sudo env PATH=/usr/local/mysql/bin:$PATH gem update do_mysql -- \
        --with-mysql-dir=/usr/local/mysql

## Install RSpec

To install the gem, or get the source from trunk:

    gem install rspec
    svn checkout http://rspec.rubyforge.org/svn/trunk rspec_trunk
    


