require 'rails_helper'
RSpec.describe Log, :type => :model do
    before do
        @hotel = build(:hotel)
        @hotel.save
        @room = build(:room , hotel_id: @hotel.id)
        @room.save
        @user = build(:user)
        @user.save
    end

    context 'Log validation tests' do
        it 'ensures hotel_id presence validation' do
            log = build(:log , hotel_id:nil,user_id:@user.id,room_id:@room.id)
            expect(log.save).to eq(false)
        end
        it 'ensures room_id presence validation' do
            log = build(:log , hotel_id:@hotel.id,user_id:@user.id,room_id:nil)
            expect(log.save).to eq(false)
        end
        it 'ensures user_id presence validation' do
            log = build(:log , hotel_id:@hotel.id,user_id:nil,room_id:@room.id)
            expect(log.save).to eq(false)
        end
        it 'ensures startdate presence validation' do
            log = build(:log , hotel_id:@hotel.id,user_id:@user.id,room_id:@room.id,startdate:nil)
            expect(log.save).to eq(false)
        end
        it 'ensures enddate presence validation' do
            log = build(:log , hotel_id:@hotel.id,user_id:@user.id,room_id:@room.id,enddate:nil)
            expect(log.save).to eq(false)
        end
        it 'created successfully' do
            log = build(:log , hotel_id:@hotel.id,user_id:@user.id,room_id:@room.id)
            expect(log.save).to eq(true)
        end
    end
end