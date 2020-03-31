ActiveAdmin.register Room do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params  :home_type , :room_type , :accommodate , :bed_room , :bath_room , :listing_name , :summary , :address , :is_wifi , :is_tv , :is_closet , :is_shampoo , :is_swimming_pool , :is_heating , :is_air , :is_kitchen , :price ,  :active
  
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
