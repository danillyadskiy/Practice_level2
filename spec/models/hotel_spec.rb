require 'spec_helper'

RSpec.describe Hotel do
  let(:user) { FactoryGirl.create(:user) }

  before do
  upload = ActionDispatch::Http::UploadedFile.new({
  :filename => 'greeting_pic.jpg',
  :content_type => 'image/jpg',
  :tempfile => File.new("#{Rails.root}/spec/models/greeting_pic.jpg")
})
    @hotel = Hotel.new(title: "Example",star_rating: 5, breakfast:"yes", room_desc:"Example",price:"143", address:"Somewhere", user_id: 1,:image => upload)
  end
 subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:star_rating) }
  it { should respond_to(:breakfast) }
  it { should respond_to(:room_desc) }
  it { should respond_to(:price) }
  it { should respond_to(:address) }
  it { should respond_to(:image) }
  
  it { should be_valid }


  describe "when title is not present" do
    before { @hotel.title = " " }
    it { should_not be_valid }
  end
  describe "when star_rating is not valid" do
    before { @hotel.star_rating = 8 }
    it { should_not be_valid }
  end
  describe "when room_desc is not present" do
    before { @hotel.room_desc = " " }
    it { should_not be_valid }
  end
  describe "when price is not present" do
    before { @hotel.price = " " }
    it { should_not be_valid }
  end
  describe "when address is not present" do
    before { @hotel.address = " " }
    it { should_not be_valid }
  end
  describe "title length validation" do
    it "should be invalid" do
    titles = %w[OzdorovitelniycompleksBerezkalength:40, O]
    titles.each do |invalid_title|
        @hotel.title = invalid_title
        expect(@hotel).not_to be_valid
        end
    end
  end
end  
