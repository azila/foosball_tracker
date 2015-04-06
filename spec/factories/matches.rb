FactoryGirl.define do
  factory :match do
    association :player_1, factory: :player
    association :player_2, factory: :player
    player_1_score 9
    player_2_score 10
    match_date { Faker::Date.forward(1) }
  end
end