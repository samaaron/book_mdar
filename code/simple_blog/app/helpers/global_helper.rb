module Merb
  module GlobalHelper
    def time_ago(t)
      return "" if t.nil?
      s = Time.now - t
      if s <= 60
        "less than a minute"
      elsif s <= (60*60)
        "#{(s.to_f / 60.0).round} minutes"
      elsif s <= (60*60*24)
        "#{((s.to_f / 60.0) / 60.0).round} hours"
      else
        "#{(((s.to_f / 60.0) / 60.0) / 24.0).round} days"
      end
    end
  end
end    