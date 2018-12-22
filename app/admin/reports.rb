ActiveAdmin.register Report do
  # belongs_to :user
  menu priority: 2
  permit_params :title, :content

  form do |f|
    inputs do
      input :title
      input :content
      input :user_id
    end
  end
end
