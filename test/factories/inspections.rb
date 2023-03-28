FactoryBot.define do
  factory :inspection do
    device { association :device }
    creator_user_id { 1 }
    assigned_user { 1 }
    conclusion { 'MyString' }
    conclusion_date { '2023-02-15 09:04:09' }
    description { 'MyText' }
    state { 'active' }
  end
end
