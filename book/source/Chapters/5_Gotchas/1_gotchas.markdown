# Gotchas

## Merb
(TODO) - Merb/Rails diffs

### Freezing gems
As Merb is spilt up into various gems, and it's hard to keep update with each one it's a good idea to freeze them into your application, so an update to one gem doesn't break your app.

The easiest way to freeze a gem is to add -i gems as a command line option to specify the location for the installed gem.

    gem install merb-core -i gems

When running this command from the root of your merb application, it will install the gem inside the gem directory

If you want to freeze the version of the gem that you have installed which is from trunk, you'll need to find where your gems are located and pass that parameter to the gem install command.

    gem environment gemdir
    
As I have installed Ruby via port my gem folder is located at `/opt/local/lib/ruby/gems/1.8`.
To freeze the `merb-core` gem I have from trunk I would need to run:

    gem install /opt/local/lib/ruby/gems/1.8/cache/merb-core-0.9.1.gem -i gems


Run the `merb-gen frozen-merb` command to instal a script for running your frozen merb gem. Once your gem is frozen, you can run merb with `./script/frozen-merb`

## DataMapper
(TODO) - DM / AR diffs

## RSpec

(TODO) - Test:Unit / RSpec diffs