FactoryBot.define do
  factory :service do
    name
    division { association :division }
    organization { association :organization }
    building { association :building }
  end
end
