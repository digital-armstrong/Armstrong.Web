FactoryBot.define do
  factory :user do
    first_name
    last_name
    email
    tabel_id
    password { '123456' }
    password_confirmation { '123456' }
    role { 'admin' }
  end
end
