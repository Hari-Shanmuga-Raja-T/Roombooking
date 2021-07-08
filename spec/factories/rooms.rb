FactoryBot.define do
  factory :room do
    roomid {'example201'}
    hotel_id { nil }
    roomno { '201' }
    status { 'Available' }
    price { '750' }
  end
end
