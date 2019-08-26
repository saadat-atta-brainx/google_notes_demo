ActiveAdmin.register Note do

  config.per_page = [10, 25, 50]

  filter :title
  filter :description
  filter :user

  permit_params :title, :description, :is_pinned, :is_archive, :status, :background_color, images: []

  scope :all
  scope 'Active', :activated, default: true
  scope 'Pinned', :pinned

  index do
    selectable_column
    column :id
    column :title
    column :description, sortable: false
    column :user
    actions
  end

  member_action :delete_image_attachment, method: :delete do
    @note = current_user.notes.activated.find(params[:id])
    @note.images.find_by(params[:attachment_id]).purge
    redirect_to admin_note_path(@note)
  end

  show do
    attributes_table_for note do
      row :description
      row :is_pinned
      row :is_archive
      row :background_color do |color|
        color_field_tag :background_color, note.background_color, readonly: true
      end
      row 'Attachments' do
        columns do
          note.images.each do |image|
            column max_width: '100%', min_width: '100%' do
              img tag, src: url_for(image)
              text_node link_to 'Remove', delete_image_attachment_admin_note_path(note, image.id), method: :delete, data: { confirm: 'Are you sure?' }
            end
          end
        end
      end
    end
  end

  form do |f|
    inputs 'Details' do
      input :title
      input :description
      input :status
      input :is_pinned
      input :is_archive
      input :background_color
      f.inputs do
        f.input :images, as: :file, input_html: { multiple: true }
      end
      panel 'Attachments' do
        note.images.each do |image|
          img tag, src: url_for(image)
          text_node link_to 'Remove', delete_image_attachment_note_path(note, image.id), method: :delete, data: { confirm: 'Are you sure?' }
        end
      end
      actions
    end
  end
end



