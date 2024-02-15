FactoryBot.define do
  factory :channel do
    channel_id { 1 }
    control_point { association :control_point }
    server { association :server }
    service { association :service }
    location_description { 'MyText' }
    self_background { 1.5 }
    pre_emergency_limit { 1.5 }
    emergency_limit { 1.5 }
    consumption { 1.5 }
    conversion_coefficient { 1.5 }
    event_system_value { 1.5 }
    event_not_system_value { 1.5 }
    event_impulse_value { 1.5 }
    event_datetime { '2023-02-15 09:45:22' }
    event_count { 1 }
    event_error_count { 1 }
    is_special_control { false }
    is_online { false }
    state { 'MyString' }
  end
end
