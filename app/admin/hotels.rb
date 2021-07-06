ActiveAdmin.register Hotel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :hotelname, :email, :phno, :address, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  permit_params do
    permitted = [:email,:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :hotelname ,  :phno, :address]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  form do |f|
    f.inputs "Hotel" do
      f.input :hotelname
      f.input :email
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :phno
      f.input :address
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :hotelname
    column :email
    column :phno
    column :address
    actions
  end
  filter :address , as: :select 
  filter :hotelname , as: :select
  
end
# permit_params do
#   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phoneno, :address, :room_count]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end