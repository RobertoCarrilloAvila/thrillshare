Rails.application.routes.draw do
  
  scope :v1 do
	  resources :schools, except: [:index, :show]
  end

end
