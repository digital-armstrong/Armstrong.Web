FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :second_name, :avatar_url, :password, :serial_id, :name] do |n|
    "this_string#{n}"
  end

  sequence :integer, aliases: [:inventory_id, :tabel_id] do |n|
    n
  end

  sequence(:phone) { |n| "+#{n} (#{n}#{n}#{n}) #{n}#{n}#{n}-#{n}#{n}-#{n}#{n}" }

  sequence(:email) { |n| "person#{n}@example.com" }

  sequence(:ip_adress) { |n| "#{n}.#{n}.#{n}.#{n}" }
end
