ActiveAdmin.register Bug do
  permit_params :title, :description, :priority, :status

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :priority
    column :status
    actions # Add default actions (view, edit, delete)
  end

  # Customize the filters for the index view
  filter :name
  filter :category
  filter :price

  # Customize the form for the new and edit views
  form do |f|
    f.inputs "Bug Details" do
      f.input :title
      f.input :description
      f.input :priority
      f.input :status
    end
    f.actions
  end
end
