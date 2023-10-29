ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   #permit_params post: [:name, :title, :content, :author, :post_image]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :title, :content, :author, :post_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    def permitted_params
      params.permit!
    end
  end
end
