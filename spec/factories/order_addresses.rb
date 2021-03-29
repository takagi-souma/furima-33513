FactoryBot.define do

  factory :order_address do
    postal_cord     {"111-1111"}
    city             {"あああ"}
    address         {"あああ"}
    phone_number    {00000000000}
    token           {"tok_abcdefghijk00000000000000000"}
    prefecture_id   {2}
    building        {"あああ"}
  end
end
