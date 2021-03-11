FactoryBot.define do
  factory :item do 
    name                   {'テスト'}
    info                   {'テスト'}
    category_id            {2}
    status_id              {2}
    area_id                {2}
    delivery_day_id        {2}
    delivery_fee_id        {2}
    price                  {1000}
    user

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test_image.png')
    end
  end
end