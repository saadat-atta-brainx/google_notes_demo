ActiveAdmin.register User do

  show do
    default_main_content
    panel "User Notes" do
      table_for user.notes do
        column :id do |note|
          link_to note.id, admin_note_path(note)
        end
        column :title
        column :description
        column "Active", :status
      end
    end
  end

  ActiveAdmin.register User do
    filter :email
    filter :username
  end

end
