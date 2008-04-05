# What is Merb, DataMapper & RSpec?

> If you're not living on the edge, you're taking up too much room. - Alice Bartlett

Merb (Mongrel + ERB), DataMapper and RSpec are all open source projects, which can be used for building kick-ass web applications. As they are in active development, it can be hard to keep up, but we'll try our best to keep up to date.

## Merb

Merb is a bit like Ruby on Rails, as they both are frameworks for building web applications. It's a relatively new framework and was created by [Ezra Zygmuntowicz](http://brainspl.at/).

If you know Ruby and have used Rails you're likely to get the hang of Merb quite easily. Where Merb differs the most from Rails is it's approach to modularisation, it's not tied down to a particular ORM for example so you can use any one you wish.

This means the core of Merb is simple with additional functionality provided by gems.

Merb is actually made up of a number of gems, merb-core, merb-more, merb-plugins. This is so you can pick and choose the functionality you need, the gem merb installs both merb-core and merb-more so you can get started straight away.

You might be wondering what's the benefit of this? Well merb-core can be used as an upload server, provide an api or as simple web app (a la [camping](http://code.whytheluckystiff.net/camping/)) where the functionality of a fully fledged framework isn't necessary. It also supports the [rack webserver interface](http://rack.rubyforge.org/) so you can use any web server that has rack support (mongrel, thin, etc.) 

## Datamapper

DataMapper is a Object-Relational Mapper (ORM) written in Ruby, created by Sam Smoot and is what we'll be using with Merb, you could use the same ORM Rails uses (ActiveRecord), but as there are plenty of examples of using ActiveRecord already I've chosen to use DataMapper.

It has some nice features which makes it faster than ActiveRecord in some cases, but what really stands out for me is the way it handles database attributes. The schema, migrations and attributes are all defined in one place, your model. So you no longer have to look around in your database or other files to see what is defined.

DataMapper has some similarities with ActiveRecord but we will highlight the differences as we go along.

## RSpec

(TODO) intro to RSpec