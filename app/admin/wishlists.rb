ActiveAdmin.register Wishlist do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :room_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:room_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Wishlist" do
      f.input :room_id
      f.input :user_id
    end
    f.actions
  end
end
