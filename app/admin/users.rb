ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :remember_created_at, :firstname, :lastname, :phno, :address
  #
  # or
  #
  permit_params do
    permitted = [:email,:encrypted_password, :firstname, :lastname, :phno, :address]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :email
    column :phno
    column :address
    actions
  end
  filter :firstname , as: :select 
  filter :lastname , as: :select
  filter :email , as: :select
end
