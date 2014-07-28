FactoryGirl.define do
  factory :song do
    name { Faker::Company.name }
    lyrics { Faker::Lorem.paragraphs(2).join("\n") }
    key { "C" }

    ignore do
      last_done_on nil
    end

    before(:create) do |song, eval|
      if eval.last_done_on
        song.song_lists << create(:song_list, done_on: eval.last_done_on)
      end
    end
  end
end
