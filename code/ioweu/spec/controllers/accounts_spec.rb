require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Accounts Controller", "index action" do
  before(:each) do
    @controller = Accounts.build(fake_request)
    @controller.dispatch('index')
  end
end