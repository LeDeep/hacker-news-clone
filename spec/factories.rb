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
      ignore do 
        votes_count 2
      end

      after(:create) do |link, evaluator|
        FactoryGirl.create_list(:vote, evaluator.votes_count, link: link)
      end
    end
  end

end