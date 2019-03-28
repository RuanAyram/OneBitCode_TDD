FactoryBot.define do
  factory :weapon do
    name { FFaker::Company.name }
    description { FFaker::Product.product }
    power_base { FFaker::Random.rand(1..3000) }
    power_step { FFaker::Random.rand(1..100) }
    level { FFaker::Random.rand(1..50) }
  end
end
