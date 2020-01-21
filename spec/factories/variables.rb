FactoryBot.define do
  factory :variable do
    court_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    civility { Faker::TvShows::DrWho.the_doctor }
    denomination { Faker::TvShows::DrWho.character }
  end
end
