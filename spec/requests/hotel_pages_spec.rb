require 'spec_helper'

describe "Hotel pages" do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  subject { page }
  describe "create" do
    before do
      visit "/signin"
      fill_in "E-mail", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      click_link "Add hotel"
      fill_in "Title", with:"New"
      select '5', :from => "hotel_star_rating"
      select 'yes', :from => "hotel_breakfast"
      fill_in "Room desc", with: "New"
      fill_in "Price", with: "100"
      fill_in "Address", with: "Nowhere"
      attach_file "Image", "#{Rails.root}/spec/greeting_pic.jpg", visible: false
      click_button "Submit"
    end
    it {should have_content("New")}
  end
  describe "hotel page" do
    let!(:hotel){ FactoryGirl.create(:hotel, title: "Example", star_rating:5, breakfast:"yes", room_desc: "Example", price:"100", address: "jjdfhj",image: 
  ActionDispatch::Http::UploadedFile.new({
  :filename => 'greeting_pic.jpg',
  :content_type => 'image/jpg',
  :tempfile => File.new("#{Rails.root}/spec/greeting_pic.jpg")}), user_id: user.id)}
    before { visit "/hotels/"+hotel.id.to_s }

    it { should have_content(hotel.room_desc) }
end

    describe "comments" do
      let!(:hotel){ FactoryGirl.create(:hotel, title: "Example", star_rating:5, breakfast:"yes", room_desc: "Example", price:"100", address: "jjdfhj",image: 
  ActionDispatch::Http::UploadedFile.new({
  :filename => 'greeting_pic.jpg',
  :content_type => 'image/jpg',
  :tempfile => File.new("#{Rails.root}/spec/greeting_pic.jpg")}), user_id: user.id)}
      let(:comment1){FactoryGirl.create(:comment)}
      let!(:comment2){FactoryGirl.create(:comment, hotel_id: hotel.id, body: "I thought", user_name:"Not me")}
      before { visit "/hotels/"+hotel.id.to_s }
      it { should have_content(comment1.user_name) }
      it { should have_content(comment2.user_name) }
    end

  describe "signup page" do
    before { visit "/signup" }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
  describe "signup page" do

    before { visit "/signup" }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "E-mail",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
