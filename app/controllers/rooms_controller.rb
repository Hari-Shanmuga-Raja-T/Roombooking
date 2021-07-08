class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_hotel!, except: [:indexs]
  before_action :correct_hotel, only: [:show, :edit, :update,:destroy]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    @room = Room.where(hotel_id:current_hotel.id)
    respond_to do |format|
      format.html
      format.csv { send_data @room.to_csv}
    end
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = current_hotel.rooms.build
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    param = room_params
    
    roomtype=Roomtype.new
    roomtype.AC=param[:AC]
    roomtype.beds=param[:beds].to_i
    param.delete("AC")
    param.delete("beds")
    @room = current_hotel.rooms.build(param)
    respond_to do |format|
      if @room.save
        roomtype.room_id=@room.id
        roomtype.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    param=room_params
    actype=param[:AC]
    bedcount=param[:beds]
    param.delete("AC")
    param.delete("beds")
    @room=Room.find_by(roomid:param[:roomid])
    respond_to do |format|
      if @room.update(param)
        roomtype=@room.roomtype
        roomtype.update(AC:actype,beds:bedcount)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_hotel
    @room = current_hotel.rooms.find_by(id: params[:id])
    redirect_to rooms_path, notice: "Not authorized for this action" if @room.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:roomid,:roomno, :status, :price, :hotel_id, :AC, :beds)
    end

    
end
