FactoryBot.define do
  factory :item do
    item         {'test'}
    explanation  {'test'}
    price        {'11111'}
    category_id  {2}
    condition_id {2}
    charges_id   {2}
    area_id      {2}
    day_id       {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_images.png')
    end
  end
end
