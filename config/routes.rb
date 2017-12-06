Rails.application.routes.draw do

  devise_for :users
  devise_for :models
	root 'posts#index', as: 'home'
	get 'about' => 'pages#about', as: 'about'

  devise_scope :user do
  	get '/users/sign_out' => 'devise/session#destroy'
  end

	resources :posts do
		resources :comments
	end
end
