FactoryBot.define do
  factory :buy_history do
    postal_code            { '000-0000' }
    area_id                { 2 }
    municipality           {'東京都'}
    address                {'八王子市'}
    phone_number           {'09098765432'}
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end