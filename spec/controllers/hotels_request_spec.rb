require 'rails_helper'
RSpec.describe HotelsController, type: :request do
    before do
        @user = build(:user)
        @user.save
        hotel = build(:hotel)
        hotel.save
        room = build(:room , hotel_id: hotel.id)
        room.save
        roomtype = build(:roomtype ,room_id: room.id)
        roomtype.save
        discount = build(:discount, hotel_id: hotel.id)
        discount.save
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {hotel}
        allow_any_instance_of(RoomsController).to receive(:authenticate_user!) {true}
        allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
    end
    context "For helper method" do
        it 'to ensure it return a full name' do
            expect(subject.full_name(@user)).to eq("Hari T")
        end
    end
    context "For testing flow" do
        it 'to ensure /rooms returns the rooms' do
            get '/rooms'
            expect(response).to render_template 'rooms/index'
        end
        it 'to ensure New room returns the add room page' do
            get '/rooms/new'
            expect(response).to render_template 'rooms/new'
        end
        it 'to ensure Add room returns the add room page' do
            get new_room_path
            expect(response).to render_template 'rooms/new'
        end
        it 'to ensure back returns to rooms page' do
            get rooms_path
            expect(response).to render_template 'rooms/index'
        end
    end
end
