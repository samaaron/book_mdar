require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Transactions Controller", "index action" do
  before(:each) do
    @controller = Transactions.build(fake_request)
    @controller.dispatch('index')
  end
end