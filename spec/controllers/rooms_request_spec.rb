require 'rails_helper'
RSpec.describe "RoomsRequest", type: :request do
    before do
        @hotel = build(:hotel)
        @hotel.save
        @room = build(:room, hotel_id: @hotel.id)
        @room.save
    end
    context "for api" do
        it 'returns a successful response(api#index)' do
            get api_v1_rooms_path
            expect(valid_json?(response)).to eq(true)
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
    
    private
    def valid_json?(response)
        JSON.parse(response.body.to_s)
        return true
      rescue JSON::ParserError => e
        return false
    end
end
    