Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
  	post '/signup', to: 'registrations#create'
  	post '/login', to: 'sessions#create'
  	delete '/logout', to: 'sessions#destroy'
  end

  scope :v1 do
	  resources :schools, except: [:index, :show]
  	resources :recipients, only: [:create, :update, :show, :destroy]
	  
	  resources :orders, only: [:create, :update, :show] do
	  	post :cancel, on: :member
	  	post :ship, on: :member
	  end	
  end

end
