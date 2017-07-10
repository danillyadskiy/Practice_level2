require "spec_helper"

RSpec.describe "route of user",:type => :routing do
  it "rotes /signup to user#new" do
    expect(:get => "/signup").to route_to(
    :controller => "users",
    :action => "new")
  end
end
