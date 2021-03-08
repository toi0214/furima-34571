FactoryBot.define do
  factory :user do 
    nickname               {'test'}
    email                  {'test@test'}
    password               {'test0000'}
    password_confirmation  {password}
    first_name             {'田中'}
    second_name            {'太朗'}
    given_name             {'タナカ'}
    last_name              {'タロウ'}
    birthday_id            {'1933-01-01'}
  end
end