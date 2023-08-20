FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.email }
    password              {'abc000'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birth_date            {'1930-01-01'}
  end
end