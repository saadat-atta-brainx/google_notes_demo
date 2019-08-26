ActiveAdmin.register User do

  filter :email
  filter :username

  show do
    default_main_content
    panel 'User Notes' do
      table_for user.notes do
        column :id
        column :title
        column :description
        column 'Active', :status
      end
    end
  end
end
