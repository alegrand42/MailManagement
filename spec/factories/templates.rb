FactoryBot.define do
  factory :template do
    mail { Faker::Books::Dune.quote }
    code { Faker::Books::Dune.title }
  end
end
