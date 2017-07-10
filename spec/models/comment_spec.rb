require 'spec_helper'

RSpec.describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @comment = Comment.create(user_name: user.name,body:"Example",hotel_id:1)
  end
 subject { @comment }

  it { should respond_to(:user_name) }
  it { should respond_to(:body) }
  it { should respond_to(:hotel_id) }
  
  it { should be_valid }
  describe "when user_name is not present" do
    before { @comment.user_name = ""}
    it { should_not be_valid }
  end
    describe "when body is not present" do
    before { @comment.body = "" }
    it { should_not be_valid }
  end
    describe "when hotel_id is not present" do
    before { @comment.hotel_id = "" }
    it { should_not be_valid }
  end


end  
