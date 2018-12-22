ActiveAdmin.register User do
  menu priority: 1
  permit_params :email, :password, :password_confirmation, :name, :age, :role

  index do
    render partial: 'hello'
    selectable_column
    id_column
    column :name
    column :age
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :age
      f.input :role
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
