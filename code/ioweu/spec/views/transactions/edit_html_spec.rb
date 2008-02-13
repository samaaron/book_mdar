require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/transactions/edit" do
  before(:each) do
    @controller,@action = get("/transactions/edit")
    @body = @controller.body
  end

  it "should mention Transactions" do
    @body.should match(/Transactions/)
  end
end