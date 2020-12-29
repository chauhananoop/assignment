Rails.application.routes.draw do
	devise_for :users
	  devise_scope :user do
		get 'sign_in', to: 'devise/sessions#new'
		get 'sign_up', to: 'devise/registrations#new'
	  
	  	authenticated :user do
		  	resources :staffs
		    root 'staffs#index', as: :authenticated_root
	  	end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
