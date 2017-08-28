ActiveAdmin.register Review do
  permit_params :all, except: [:restaurant_name]
  actions :all, except: [:destroy]
end
