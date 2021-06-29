require 'rails_helper'
RSpec.describe RoomsController, type: :controller do
    before do
        @hotel = build(:hotel)
        @hotel.save
        @room = build(:room , hotel_id: @hotel.id)
        @room.save
        @rooms =  build(:room,hotel_id: @hotel_id)
        allow_any_instance_of(RoomsController).to receive(:current_hotel) {@hotel}
        # allow_any_instance_of(RoomsController).to receive(:current_user) {@room}
    end
    let (:params) {{roomid:'example201',hotel_id:@hotel.id.to_s,roomno:'201',price:'750',status:'Available',roomtype:'AC/2B'}}
    context 'GET request' do
        it 'returns a successful response(index)' do
            get :index
            expect(response).to be_successful
        end
        
        it 'returns a successful response(show)' do
            get :show, params: {id: @room.id}
            expect(response).to be_successful
        end

        # it 'returns a successful response(create)' do
        #     post :create, params: params
        #     expect(response.to be_successful)
        # end
    end
end