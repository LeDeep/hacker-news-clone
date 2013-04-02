FactoryGirl.define do 
  factory :user do
    password "fooAAnnn$$54"
    password_confirmation 'fooAAnnn$$54'
    email "foo@example.com"
  end

  factory :vote do
    up_down 1
    link
  end

  factory :link do
    url 'http://www.google.com'
    description 'Search'

    factory :link_with_votes do 
      after(:create) do |link, evaluator|
        10.times {FactoryGirl.create(:vote, link: link)}
      end
    end
  end

end