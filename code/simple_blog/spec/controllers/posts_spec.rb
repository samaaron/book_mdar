require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

# describe Posts, "show action" do
#   it "should find post and render show view" do
#     post = mock(Post)
#     Post.should_receive(:[]).with("1").and_return(nil)
#     get("/posts/1")
#     controller.status.should == 200
#   end
# end

describe Posts, "show action" do
  it "should find post and render show view" do
    Post.should_receive(:[]).with("1")
    get('/posts/1', :yields => :controller) do
      controller.stub!(:render)
    end
    status.should == 200
  end
  
  it "should return 500 if post doesn't exist" do
    post = mock(Post)
    Post.should_receive(:[]).with("1").and_raise(DataMapper::ObjectNotFoundError)
    get('/posts/1')
    status.should == 404
  end
end

# describe Posts, "show action" do
#   it "should find post and render show view" do
#     post = mock(Post)
#     Post.should_receive(:[]).with("1").and_return(nil)
# 
#     controller, result = dispatch_to(Posts, :show, :id => "1") do |controller|
#       controller.stub!(:render).and_return("rendered response")
#     end
# 
#     controller.status.should == 200
#   end
# end
# 
# describe Posts, "show action" do
#   before(:each) do
#     @controller = Posts.build(fake_request)
#     # @controller.stub!(:params).and_return(opts.merge(:controller => klass.name.downcase, :action => action.to_s).to_mash)
#     @controller.dispatch(:show)
#   end
#   
#   it "should find post and render show view" do
#     post = mock(Post)
#     Post.should_receive(:[]).with("1").and_return(nil)
#     @controller.stub!(:render).and_return("rendered response")
#     @controller.get("/posts/1")
# 
#     # controller, result = dispatch_to(Posts, :show, :id => "1") do |controller|
#     #   controller.stub!(:render).and_return("rendered response")
#     # end
#     # puts controller.to_yaml
#     controller.status.should == 200
#     # controller.assigns(:post).should == post
#   end
# end