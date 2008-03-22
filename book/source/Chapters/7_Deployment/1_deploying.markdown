# Deploying a Merb Application

> "Good Quote Here"

The most satisfying experience of building a web application is having others use it.  Implementing a robust deployment plan is essential to ensure each release of your project goes off with out a hitch.  

## The Pieces

#### Subversion

Version control is an essential piece of any software development cycle.  There are several options available, including CVS, Git, Subversion, and many more.  This guide assumes you have either a Subversion or Git repo that holds your application.  

#### Nginx

A proxy is required to handle incoming HTTP requests.  Here there are several options including Apache, Lighttpd, Swiftiply, and many more.  A favorite in the community for performance and simplicity has become Nginx, which we'll use for this example.  Developed in Russia by Igor Sysoev, the goal of Nginx is to provide a lightweight, high performance web server.

#### Capistrano

Merb deployment's base lies with Capistrano.  Originally developed to ease the process of pushing Rails applications into production, it has been improved upon to more generally provide automating tasks via SSH on remove servers.  It can be used for software installation, application deployment, configuration management, and much more.

#### Mongrel

For our merb instances, there are a variety of Ruby web servers.  The de facto standard has been Mongrel, which has also spawned improved stacks such as Thin and Swiftiply.  It is extremely easy to change, so examples for all 3 will be provided.

## Preparing Your Production Server

## Building a Deployment Recipe with Capistrano

Install Capistrano.

    gem install capistrano

Navigate to your Merb repository directory and run the capify command to create the skeleton for your deployment recipe.

    $ capify .
    [add] writing `./Capfile'
    [add] writing `./config/deploy.rb'
    [done] capified!

The Capfile will contain your deployment tasks, and the deploy.rb file will contain your application variables.

## Mongrel and Alternatives

(TODO)

## Other Resources