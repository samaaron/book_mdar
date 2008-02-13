module Merb
  module GlobalHelper
    # helpers defined here available to all views.
    
    def money(value)
      value ==  0 ? 'nothing!' : '£' + sprintf("%.2f", value)
    end 
  end
end    