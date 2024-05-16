ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role_id

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  filter :email
  filter :role
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: Role.all.collect { |role| [role.actual_name, role.id] }, include_blank: false
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
