require 'rails_helper'
RSpec.describe UsersController, type: :request do
    before do
        hotel = build(:hotel)
        hotel.save
        @room = build(:room , hotel_id: hotel.id)
        @room.save
        discount = build(:discount, hotel_id: hotel.id)
        discount.save
    end
    context "For helper method" do
        it 'to ensure it return a updated price' do
            expect(subject.update_price(@room)).to eq(675.0)
        end
    end
end
