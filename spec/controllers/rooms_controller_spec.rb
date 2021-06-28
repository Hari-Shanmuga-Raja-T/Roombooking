require 'rails_helper'
RSpec.describe RoomsController, type: :controller do
    before do
        @hotel = Hotel.new(hotelname:'Sample',email:'Sample@gmail.com',phno:'8523697418',address:'coimbatore',room:'1',password:'Qwerty@23jnjn')
        @hotel.save
        @room = Room.create!(roomid:'dummy201', hotel_id:@hotel.id, roomno:'201', status:'Available', price:'750', roomtype:'AC/3B')
        @room.save
    end
    context 'GET request' do
        it 'returns a successful response(index)' do
            get :index
            expect(response).to be_successful
        end
        
        # it 'returns a successful response(show)' do
        #     get :show, params: {id: @room.id}
        #     expect(response).to be_successful
        # end
    end
end