class Users < Application
  provides :xml, :js, :yaml
  
  def index
    @users = User.all
    render @users
  end
  
  def show(id)
    @user = User[id]
    @value = @user.account.value
    @sent = @user.sent_transactions
    @received = @user.received_transactions
    render @user
    rescue DataMapper::ObjectNotFoundError
    raise NotFound unless @user
  end
  
  def new
    only_provides :html
    @user = User.new
    render @user
  end
  
  def create(user)
    @user = User.new(user)
    if @user.save
      redirect url(:user, @user)
    else
      render :action => :new
    end
  end
  
  def edit(id)
    only_provides :html
    @user = User[id]
     render
     rescue DataMapper::ObjectNotFoundError
     raise NotFound unless @user
  end
  
  def update(id, user)
    @user = User[id]
    
    if @user.update_attributes(user)
      redirect url(:user, @user)
    else
      raise BadRequest
    end
    rescue DataMapper::ObjectNotFoundError
      raise NotFound unless @user
  end
  
  def destroy(id)
    @user = User[id]
    if @user.destroy!
      redirect url(:users)
    else
      raise BadRequest
    end
    rescue DataMapper::ObjectNotFoundError
      raise NotFound unless @user
  end
end