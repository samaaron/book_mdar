class Transaction < DataMapper::Base
  #not really a transaction but I coudn't think of a name
  
  after_create :credit_ac
  after_destroy :deduct_ac
      
  after_materialize :convert_to_float
  before_save :convert_to_string

  
  belongs_to :receiver, :class => 'User', :foreign_key => 'receiver_id'
  belongs_to :sender, :class => 'User', :foreign_key => 'sender_id'
  
  validates_presence_of :sender_id, :receiver_id, :value
  
  property :value, :string
  property :created_at, :datetime
  property :updated_at, :datetime
  
  def convert_to_float
    @value = @value.to_f
  end
  def convert_to_string
    @value = @value.to_s
  end
  
  # sets the variables, receiver, their account and the ammount
  def set_up
    @r = User[@receiver_id]
    @x = @r.account.value.to_f
    @y = @value.to_f
  end
  
  def deduct_ac
    set_up
    @r.account.value = @x - @y
    @r.account.save!    
  end
  
  def credit_ac
    set_up
    @r.account.value = @x + @y
    @r.account.save!
  end
end

