FactoryBot.define do
  factory :mail do
    subject { Faker::TvShows::DrWho.catch_phrase }
    template_id { 1 }
    to { Faker::TvShows::DrWho.character }
    from { Faker::TvShows::DrWho.the_doctor }
    deliver_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
