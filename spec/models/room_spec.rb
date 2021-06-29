require 'rails_helper'

RSpec.describe Room, :type => :model do
    before do
        @hotel = create(:hotel)
        # allow_any_instance_of(RoomsController).to receive(:authenticate_hotel!) {true}
        # allow_any_instance_of(UsersController).to receive(:authenticate_user!) {true}
    end
    context 'validation tests' do
        it 'ensures roomid presence' do
            room = Room.new(hotel_id:@hotel.id.to_s,roomno:'201',status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures hotel_id presence' do
            room = Room.new(roomid:'example201',roomno:'201',status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures roomno presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures status presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,roomno:'201',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures price presence' do
            room = Room.new(roomid:'example201',hotel_id:@hotel.id.to_s,roomno:'201',status:'Available',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures roomtype presence' do
            room = build(:room, roomtype: nil,hotel_id: @hotel.id)
            expect(room.save).to eq(false)
        end
        it 'Successfully saved' do
            room = build(:room,hotel_id: @hotel.id)
            expect(room.save).to eq(true)
        end
    end

    context 'scope tests' do
    end
end