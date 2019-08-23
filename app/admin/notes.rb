ActiveAdmin.register Note do

  scope :all
  scope "Active", :activated, default: true
  scope "Pinned", :pinned

  index do
    selectable_column
    column :id do |note|
      link_to note.id, admin_note_path(note)
    end
    column :title
    column :description, sortable: false
    column :user do |note|
      link_to note.user.username, admin_user_path(note.user_id)
    end
    actions
  end


  ActiveAdmin.register Note do
    config.sort_order = "id_asc"
    config.per_page = [10, 25, 50]

    filter :title
    filter :description
    filter :user

    permit_params :title, :description, :is_pinned, :is_archive, :status, :background_color, images: []

    show do
      attributes_table_for note do
        row :description
        row "Attachments" do
          columns do
            note.images.each do |image|
              column max_width: "100%", min_width: "100%" do
                img tag, src: url_for(image)
              end
            end
          end
        end
      end
    end

    form multipart: true do |f|
      inputs 'Details' do
        input :title
        input :description
        input :status
        input :is_pinned
        input :is_archive
        input :images, :as => "file"
        panel 'Attachements' do
          note.images.each do |image|
            img tag, src: url_for(image)
          end
        end
        actions
      end
    end
  end
end


