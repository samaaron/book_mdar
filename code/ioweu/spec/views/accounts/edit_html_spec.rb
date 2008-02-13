require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/accounts/edit" do
  before(:each) do
    @controller,@action = get("/accounts/edit")
    @body = @controller.body
  end

  it "should mention Accounts" do
    @body.should match(/Accounts/)
  end
end