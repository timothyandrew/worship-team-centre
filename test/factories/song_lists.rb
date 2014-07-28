FactoryGirl.define do
  factory :song_list do
    theme { Faker::Commerce.department }
    service { SongList::SERVICES.sample }
  end
end
