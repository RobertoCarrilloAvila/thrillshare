Rails.application.routes.draw do
  
  scope :v1 do
	  resources :schools, except: [:index, :show]
	  
	  resources :orders, only: [:create, :update] do
	  	post :cancel, on: :member
	  end
  	
  end

end
