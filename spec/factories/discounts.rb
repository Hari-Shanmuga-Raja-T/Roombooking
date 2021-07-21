FactoryBot.define do
    factory :discount do
      hotel_id {1}
      percentage {10}
      description {"New year offer"}
    end
  end