require 'rails_helper'

RSpec.describe Room, :type => :model do
    context 'validation tests' do
        it 'ensures roomid presence' do
            room = Room.new(hotel_id:'18',roomno:'202',status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures hotel_id presence' do
            room = Room.new(roomid:'vikram202',roomno:'202',status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures roomno presence' do
            room = Room.new(roomid:'vikram202',hotel_id:'18',status:'Available',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures status presence' do
            room = Room.new(roomid:'vikram202',hotel_id:'18',roomno:'202',price:'750',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures price presence' do
            room = Room.new(roomid:'vikram202',hotel_id:'18',roomno:'202',status:'Available',roomtype:'AC/2B').save
            expect(room).to eq(false)
        end
        it 'ensures roomtype presence' do
            room = Room.new(roomid:'vikram202',hotel_id:'18',roomno:'202',status:'Available',price:'750').save
            expect(room).to eq(false)
        end
        it 'Successfully saved' do
            room = Room.new(roomid:'vikram201',hotel_id:'18',roomno:'202',status:'Available',price:'750',roomtype:'AC/2B')
            expect(room.save).to eq(true)
        end
    end

    context 'scope tests' do
    end
end