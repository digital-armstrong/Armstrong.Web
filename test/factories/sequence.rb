FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :second_name, :avatar_url, :password, :serial_id] do |n|
    "this_string#{n}"
  end

  sequence(:inventory_id) { |n| n }

  sequence(:tabel_id) { |n| n }

  sequence(:phone) { |n| "+#{n} (#{n}#{n}#{n}) #{n}#{n}#{n}-#{n}#{n}-#{n}#{n}" }

  sequence(:email) { |n| "person#{n}@example.com" }

  sequence(:name) { |n| "testname#{n}" }

  sequence(:ip_adress) { |n| "#{n}.#{n}.#{n}.#{n}" }
end
