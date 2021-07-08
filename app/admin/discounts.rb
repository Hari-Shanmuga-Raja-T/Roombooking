ActiveAdmin.register Discount do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :hotel_id, :percentage, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:hotel_id, :percentage, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Discount" do
      f.input :hotel_id
      f.input :percentage
      f.input :description
    end
    f.actions
  end
end
