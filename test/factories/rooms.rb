FactoryBot.define do
  factory :room do
    name { 'MyString' }
    building { association :building }
  end
end
