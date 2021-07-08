FactoryBot.define do
  factory :log do
    hotel_id {'1'}
    room_id {'1'}
    user_id {'1'}
    startdate {Date.parse("2021-07-05")}
    enddate {Date.parse("2021-07-05")}
  end
end
