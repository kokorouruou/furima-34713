FactoryBot.define do
  factory :item do
    title                         {Faker::Lorem.sentence}
    text                          {Faker::Lorem.sentence}
    price                         { 1000 }
    category_id                      {4}
    product_condition_id             {3}
    delivery_charge_id               {3}
    prefecture_id                    {3}
    day_to_ship_id                   {3}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
