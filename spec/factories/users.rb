FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {"test"}
    last_name {"テス"}
    first_name {"テスト"}
    last_name_kana {"テス"}
    first_name_kana {"テスト"}
    birthday {1935/04/02}
  end
end