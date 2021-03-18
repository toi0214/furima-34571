FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    area_id { 1 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08088889999' }

    association :buy
  end
end
