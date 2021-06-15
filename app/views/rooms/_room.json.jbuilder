json.extract! room, :id, :roomid, :hotelid, :roomno, :status, :price, :roomtype, :created_at, :updated_at
json.url room_url(room, format: :json)
