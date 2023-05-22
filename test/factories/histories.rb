FactoryBot.define do
  factory :history do
    channel { nil }
    event_impulse_value { 1.5 }
    event_system_value { 1.5 }
    event_not_system_value { 1.5 }
    event_datetime { '2023-05-02 05:56:53' }
  end
end
