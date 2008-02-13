class Transactions < Application
  provides :xml, :js, :yaml
  
  def index
    @transactions = Transaction.all
    render @transactions
  end
  
  def show(id)
    @transaction = Transaction[id]
    render @transaction
    rescue DataMapper::ObjectNotFoundError
    raise NotFound unless @transaction
  end
  
  def new
    only_provides :html
    @users = User.all
    @transaction = Transaction.new
    render @transaction
  end
  
  def create(transaction)
    @transaction = Transaction.new(transaction)
    #(TODO) - Move this vaildation to the model, had issues with this
    if @transaction.save and @transaction.sender_id != @transaction.receiver_id
      user = User[transaction[:sender_id]]
      redirect url(:user, user)
    else
      redirect url(:new_transaction)
    end
  end
  
  def edit(id)
    only_provides :html
    @transaction = Transaction[id]
    render
    rescue DataMapper::ObjectNotFoundError
      raise NotFound unless @transaction
  end
  
  def update(id, transaction)
    @transaction = Transaction[id]
    if @transaction.update_attributes(transaction)
      redirect url(:transaction, @transaction)
    else
      raise BadRequest
    end
    rescue DataMapper::ObjectNotFoundError
      raise NotFound unless @transaction
  end
  
  def destroy(id)
    @transaction = Transaction[id]
    if @transaction.destroy!
      redirect url(:transactions)
    else
      raise BadRequest
    end
  rescue DataMapper::ObjectNotFoundError
    raise NotFound unless @transaction
  end
end