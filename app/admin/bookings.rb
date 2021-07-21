ActiveAdmin.register Booking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :hotel_id, :user_id, :room_id, :startdate, :enddate
  #
  # or
  #
  # permit_params do
  #   permitted = [:hotel_id, :user_id, :room_id, :startdate, :enddate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Booking" do
      f.input :hotel_id
      f.input :user_id
      f.input :room_id
      f.input :startdate   
      f.input :enddate
    end
    f.actions
  end
  filter :hotel_id , as: :select 
end
