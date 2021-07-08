ActiveAdmin.register Room do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :roomid, :hotel_id, :roomno, :status, :price, :roomtype
  #
  # or
  #
  # permit_params do
  #   permitted = [:roomid, :hotel_id, :roomno, :status, :price, :roomtype]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Room" do
      f.input :roomid
      f.input :hotel_id
      f.input :roomno
      f.input :status
      f.input :price
      # f.input :roomtype 
    end
    f.actions
  end
  index do
    selectable_column
    id_column
    column :roomid
    column :hotel_id
    column :roomno
    column :status
    column :price
    column :roomtype
    actions
  end
  filter :status , as: :select 
end
