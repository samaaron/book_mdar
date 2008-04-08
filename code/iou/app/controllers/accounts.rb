#can't be called account even though it's a single resource because of name clash.
class Accounts < Application
  provides :xml, :js, :yaml
  
  def show
    @user = User[params[:user_id]]
    @account = @user.account
    display @account
    rescue DataMapper::ObjectNotFoundError
      raise NotFound
  end
    
end