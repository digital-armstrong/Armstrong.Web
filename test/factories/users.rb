FactoryBot.define do
  factory :user do
    tabel_id
    first_name
    second_name
    last_name
    email { generate :email }
    phone
    password
    avatar_url { '' }
    type { '' }

    factory :inspector do
      type { 'Inspector' }
    end

    factory :admin do
      type { 'Admin' }
    end

    factory :engineer do
      type { 'Engineer' }
    end

    factory :default do
      type { 'Default' }
    end
  end
end
