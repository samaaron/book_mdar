# Gotchas

## Merb
<table>
    <th>
        The Rails way
    </th>
    <th>
        The Merb way
    </th>
    <tr>
        <td>
            script/server
        </td>
        <td>
            merb
        </td>
    </tr>
    <tr>
        <td>
            script/console
        </td>
        <td>
            merb -i
        </td>
    </tr>
    <tr>
        <td>
            script/generate
        </td>
        <td>
            merb-gen
        </td>
    </tr>
    <tr>
        <td>
           redirect_to blog_path(@blog)
        </td>
        <td>
           redirect url(:blog, @blog)
        </td>
    </tr>
    <tr>
        <td>
           respond_to
        </td>
        <td>
           provides :xml, :js, :yaml
        </td>
    </tr>
    <tr>
        <td>
           format
        </td>
        <td>
           content_type
        </td>
    </tr>
    <tr>
        <td>
          format.html
        </td>
        <td>
           only_provides :html
        </td>
    </tr>
    <tr>
        <td>
           render :xml => @post
        </td>
        <td>
           render @post
        </td>
    </tr>
    <tr>
        <td>
          render :file => ‘public/404.html’, :status => 404
        </td>
        <td>
           raise NotFound
        </td>
    </tr>
    <tr>
        <td>
          logger
        </td>
        <td>
           Merb.logger
        </td>
    </tr>
    <tr>
        <td>
          before_filter
        </td>
        <td>
           before
        </td>
    </tr>
    <tr>
        <td>
          render :partial
        </td>
        <td>
           partial
        </td>
    </tr>
    <tr>
        <td>
          f.text_field :name
        </td>
        <td>
          text_control :first_name
        </td>
    </tr>
    <tr>
        <td>
          RAILS_ENV
        </td>
        <td>
          Merb.environment
        </td>
    </tr>    
</table>

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