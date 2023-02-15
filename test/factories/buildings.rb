FactoryBot.define do
  factory :building do
    name
    organization { association :organization }
  end
end
