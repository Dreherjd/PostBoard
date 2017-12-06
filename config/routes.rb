Rails.application.routes.draw do

  devise_for :users
  devise_for :models
	root 'posts#index', as: 'home'
	get 'about' => 'pages#about', as: 'about'

	resources :posts do
		resources :comments
	end
end
