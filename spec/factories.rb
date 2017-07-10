FactoryGirl.define do
  factory :vote do
    hotel_id 1
    user_id 1
  end
  factory :hotel do
    title "MyString"
    star_rating 1
    breakfast "MyString"
    room_desc "MyText"
    price "100"
    address "MyString"
    user_id 1
    image ActionDispatch::Http::UploadedFile.new({
  :filename => 'greeting_pic.jpg',
  :content_type => 'image/jpg',
  :tempfile => File.new("#{Rails.root}/spec/greeting_pic.jpg")})
   
  end
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end
  factory :comment do
    hotel_id 1
    body "I think..."
    user_name "I"
  end  

end
