Rails.application.routes.draw do
  
  resources :schools, except: [:index, :show]

end
