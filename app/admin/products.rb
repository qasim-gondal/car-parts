ActiveAdmin.register Product do
  permit_params :name, :category_id, :price, :description, :main_image

  index do
    selectable_column
    id_column
    column :name

    column :price
    column :description
    actions
  end

  filter :name

  filter :price
  filter :description

  form do |f|
    f.inputs "Product Details" do
      f.input :name

      f.input :price
      f.input :description
      f.input :main_image, as: :file
      if f.object.main_image.present?
        f.semantic_fields_for :main_image do |image_fields|
          image_fields.input :main_image, as: :file, label: "Current Image"
        end
      end
    end
    f.actions
  end
  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :main_image do |product|
        ActiveStorage::Current.url_options if product.main_image.present?
      end
    end
  end
end
