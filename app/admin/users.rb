ActiveAdmin.register User do
  permit_params %i[email first_name email last_name created_at updated_at provider uid locale]
  form do |f|
    inputs 'Details' do
      input :email
      input :first_name
      input :last_name
      input :created_at
      input :updated_at
      input :provider
      input :uid
      input :locale
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    actions
  end
end
