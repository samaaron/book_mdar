class Home < Application
  def index
    @users = User.all
    @new_transactions = Transaction.all(:created_at.gte => Time.now - 86400*7)
    render
  end
end