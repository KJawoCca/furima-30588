FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {"1q2w3e"}
    password_confirmation {password}
    nickname {"test"}
    last_name {"テス"}
    first_name {"テスト"}
    last_name_kana {"テス"}
    first_name_kana {"テスト"}
    birthday {"1935-04-02"}
  end
end