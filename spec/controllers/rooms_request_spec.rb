require 'rails_helper'
RSpec.describe "RoomsRequest", type: :request do
    before do
        @hotel = Hotel.new(hotelname:'Sample',email:'Sample@gmail.com',phno:'8523697418',address:'coimbatore',room:'1',password:'Qwerty@23jnjn')
        @hotel.save
        @room = Room.create!(roomid:'dummy201', hotel_id:@hotel.id, roomno:'201', status:'Available', price:'750', roomtype:'AC/3B')
        @room.save
    end
    context "for api" do
        it 'returns a successful response(api#index)' do
            get api_v1_rooms_path
            expect(response).to be_successful
        end
        it 'returns a successful response(api#destroy)' do
            delete "/api/v1/rooms/"+@room.id.to_s
            expect(response).to be_successful
        end
        it 'returns a successful response(api#create)' do
            post "/api/v1/rooms", params: {roomid:'dummy202', hotel_id:@hotel.id, roomno:'201', status:'Available', price:'750', roomtype:'AC/3B'}
            expect(response).to be_successful
        end
        it 'returns a successful response(api#update)' do
            put "/api/v1/rooms/"+@room.id.to_s , params: {id:@room.id,status:"Not available"}
            expect(response).to be_successful
        end
    end
end