require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/accounts" do
  before(:each) do
    @controller,@action = get("/accounts")
    @body = @controller.body
  end

  it "should mention Accounts" do
    @body.should match(/Accounts/)
  end
end