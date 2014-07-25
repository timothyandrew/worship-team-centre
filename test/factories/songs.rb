FactoryGirl.define do
  factory :song do
    name { Faker::Company.name }
    lyrics { Faker::Lorem.paragraphs(2).join("\n") }
    key { "C" }
  end
end
