FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {'scababy1128'}
    password_confirmation {password}
    first_name            {'あぷり'}
    last_name             {'ふりま'}
    first_name_kana       {'アプリ'}
    last_name_kana        {'フリマ'}
    birthday              {'1930-01-01'}
  end
end