FactoryBot.define do
  factory :stock do
    name { "Unique: #{rand(100)}" }
    id { rand(100) }
    bearer
  end
end