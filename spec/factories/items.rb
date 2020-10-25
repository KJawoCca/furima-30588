FactoryBot.define do
  factory :item do
    name {Faker::Team.name}
    text {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    postage_id {2}
    province_id {2}
    number_of_day_id {2}
    price {3001}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
