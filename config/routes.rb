Rails.application.routes.draw do
  
  scope :v1 do
	  resources :schools, except: [:index, :show]
  	resources :recipients, only: [:create, :update, :show, :destroy]
	  
	  resources :orders, only: [:create, :update, :show] do
	  	post :cancel, on: :member
	  end
  	
  end

end
