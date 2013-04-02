FactoryGirl.define do 
  factory :user do
    password "fooAAnnn$$54"
    password_confirmation 'fooAAnnn$$54'
    email "foo@example.com"
  end

  factory :link do
    url 'http://www.google.com'
    description 'Search'
  end
end