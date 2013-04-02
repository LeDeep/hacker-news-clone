FactoryGirl.define do 
  factory :user do
    password "fooAAnnn$$54"
    password_confirmation 'fooAAnnn$$54'
    email "foo@example.com"
  end
end