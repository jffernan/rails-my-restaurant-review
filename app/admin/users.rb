ActiveAdmin.register User do
  permit_params :email
    actions :all, except: [:destroy]

end
