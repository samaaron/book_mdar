class Account < DataMapper::Base
  after_materialize :convert_to_float
  before_save :convert_to_string
 
  belongs_to :user
 
  property :value, :string
  
  def convert_to_float
    @value = @value.to_f
  end
  def convert_to_string
    @value = @value.to_s
  end
end

