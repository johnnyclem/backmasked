# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mp3datum, :class => 'Mp3data' do
    artist "MyString"
    song "MyString"
    count 1
    date "2012-08-08 02:57:26"
  end
end
