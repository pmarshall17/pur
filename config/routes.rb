Rails.application.routes.draw do

	root 'people#index'

  resources :people do
  	resources :hobbies, :location
  end
end