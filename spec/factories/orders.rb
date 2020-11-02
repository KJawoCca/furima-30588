FactoryBot.define do
  factory :order do
    postal_code {'123-1123'}
    address_line1 {'あ'}
    city {'あ'}
    province_id { 3 }
    tel {12312341234}
    user_id { 3 }
    item_id { 3 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
