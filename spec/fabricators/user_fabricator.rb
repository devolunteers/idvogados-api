# frozen_string_literal: true

Fabricator(:user) do
  email                 { Fabricate.sequence(:email) { |i| "user#{i}@example.com" } }
  name                  { Faker::Name.name }
  password              'idvogados'
end
