FactoryBot.define do
  factory :inspection do
    device { association :device }
    creator { association :user }
    performer { association :user }
    conclusion { 'MyString' }
    conclusion_date { '2023-02-15 09:04:09' }
    description { 'MyText' }
    state { 'active' }
  end
end
