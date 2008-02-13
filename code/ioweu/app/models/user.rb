class User < DataMapper::Base
  has_one :account
  has_many :sent_transactions, :class => 'Transaction', :foreign_key => 'sender_id'
  has_many :received_transactions, :class => 'Transaction', :foreign_key => 'receiver_id'
  
  validates_uniqueness_of :name
  
  after_create :link_account
  
  property :name, :string
  
  def link_account
    a = Account.new(:value => 0)
    a.save!
    self.account = a
    self.save!
  end
end

