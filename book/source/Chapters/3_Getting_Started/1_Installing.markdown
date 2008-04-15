# Getting Started

Before we get started I'm going to assume you have the following installed:

* [Ruby](http://www.ruby-lang.org/) 
* A DBMS (we'll use [MySQL](http://mysql.org/))
* [SVN](http://subversion.tigris.org/) and [git](http://git.or.cz/) (if you want to get the source code)


## Installing Merb

If you just want to play around with Merb install the `merb` gem:
    
    sudo gem install merb --source http://merbivore.org 
    
On the other hand if you want to get down and dirty it's best to grab the source code from trunk 
and you'll need to install the following gems:

    sudo gem install rack mongrel json_pure erubis mime-types rspec hpricot \
        mocha rubigen haml markaby mailfactory ruby2ruby

    git clone git://github.com/wycats/merb-core.git
    git clone git://github.com/wycats/merb-plugins.git
    git clone git://github.com/wycats/merb-more.git

   	cd merb-core ; rake install ; cd ..    
    cd merb-more ; rake install ; cd ..
    cd merb-plugins; rake install ; cd ..

If you need to use JSON you should install the `json` gem (as it's faster). `json_pure` is used so Merb will install on JRuby.

Merb is ORM agnostic, but as the title of this book suggests we'll be using DataMapper.
Should you want to stick with ActiveRecord or play with Sequel, check the [merb documentation](http://merb.rubyforge.org/files/README.html) for install instructions.

## Installing Datamapper

***
_Note: DataMapper is splitting into dm-core and dm-more so this will be outdated soon_
***

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

If you want the latest source:

	git clone git://github.com/sam/do.git

	cd do
	cd data_objects
	rake install ; cd ..
	cd ../do_mysql  # || do_postgres || do_sqlite3
	rake install

    git clone git://github.com/sam/dm-core.git
    git clone git://github.com/sam/dm-more.git

    cd dm-core ; rake install ; cd ..
    cd dm-more ; rake install ; cd ..
    cd dm-merb ; rake install ; cd ..    
    cd dm-validations ; rake install ; cd ..
    
To update a gem from source, run `git pull` and `rake install` again.

## Install RSpec

The `rspec` gem was installed in the Merb section above. However, if for some reason you didn't install it there, or want to grab the it from source, run the following commands:

    gem install rspec
    svn checkout http://rspec.rubyforge.org/svn/trunk rspec_trunk
