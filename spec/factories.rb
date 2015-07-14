FactoryGirl.define do


 factory :user do
  	name('jocelyn alsdorf')
    sequence(:email) {|n| "test#{n}@example.com" }
    password('12345678')

  end

  factory(:question) do
    title('What day is it?')
    answer_a('Monday')
    answer_b('Tuesday')

  end

  factory(:comment) do
    text('my fav')
  end
end
