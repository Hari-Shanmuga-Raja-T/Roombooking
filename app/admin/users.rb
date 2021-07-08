ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :firstname, :lastname, :phno, :address
  #
  # or
  # permit_params do
  #   permitted = [:email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :phno, :address]
  #   if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  #   end
  #   permitted
  # end
  permit_params do
    permitted = [:email,:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :phno, :address, :ban]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :phno      
      f.input :address 
      f.input :ban
    end
    f.actions
  end
  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :email
    column :phno
    column :address
    column :ban
    actions
  end
  filter :firstname , as: :select 
  filter :lastname , as: :select
  filter :email , as: :select
end
