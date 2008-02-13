require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/transactions/new" do
  before(:each) do
    @controller,@action = get("/transactions/new")
    @body = @controller.body
  end

  it "should mention Transactions" do
    @body.should match(/Transactions/)
  end
end