FactoryBot.define do
  factory :division do
    name { 'MyString' }
    organization { association :organization }
  end
end
