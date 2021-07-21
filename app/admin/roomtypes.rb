ActiveAdmin.register Roomtype do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :room_id, :AC, :beds
  #
  # or
  #
  # permit_params do
  #   permitted = [:room_id, :AC, :beds]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Roomtype" do
      f.input :room_id
      f.input :AC
      f.input :beds
    end
    f.actions
  end
  index do
    selectable_column
    id_column
    column :room_id
    column :AC
    column :beds
    actions
  end
  filter :beds , as: :select 
  
end
