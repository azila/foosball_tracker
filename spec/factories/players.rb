FactoryGirl.define do
  factory :player do
    first_name 'Liza'
    last_name 'Korotchenko'
    avatar { Faker::Avatar.image }
  end
end