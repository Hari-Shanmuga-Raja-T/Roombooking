require 'rails_helper'

RSpec.describe Room, :type => :model do
    before do
        @hotel = create(:hotel)
    end
    context 'Room validation tests' do
        it 'ensures roomid presence' do
            room = Room.new(hotel_id:@hotel.id.to_s,roomno:'201',status:'Available',price:'750').save
            expect(room).to eq(false)
        end
        it 'ensures hotel_id presence' do
            room = Room.new(roomid:'example201',roomno:'201',status:'Available',price:'750').save
            expect(room).to eq(false)
        end
        it 'ensures roomno presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,status:'Available',price:'750').save
            expect(room).to eq(false)
        end
        it 'ensures status presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,roomno:'201',price:'750').save
            expect(room).to eq(false)
        end
        it 'ensures price presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,roomno:'201',status:'Available').save
            expect(room).to eq(false)
        end
        it 'Successfully saved' do
            room = build(:room,hotel_id: @hotel.id)
            expect(room.save).to eq(true)
        end
    end

    context 'scope tests' do
    end
end