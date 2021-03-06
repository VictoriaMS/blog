Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do 
    resources :comments, only: [:create, :update, :destroy ], shallow: true
  end

  root 'posts#index'
end
