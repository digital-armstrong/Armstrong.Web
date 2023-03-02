FactoryBot.define do
  factory :service do
    name { 'MyStr2222isng' }
    division { association :division }
    organization { association :organization }
    building { association :building }
  end
end
