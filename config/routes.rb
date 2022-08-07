Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home', to: 'pages#home', as: 'home'
  post 'home', to: 'pages#rate'
  get 'shelter/matching', to: 'shelter#matching', as: 'shelter_matching'
  post 'shelter/matching', to: 'shelter#approve'
  get 'adopters/matching', to: 'adopters#matching', as: 'adopters_matching'
  get 'adopters/notify', to: 'adopters#notify', as: 'adopters_notify'
  post 'adopters/notify', to: 'adopters#continue'

  get 'profile/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  post 'profile/:id/edit', to: 'profiles#edit'
  get 'profile/:user_id', to: 'profiles#show', as: 'view_profile'
  patch '/profile.:id', to: 'profiles#update'
  put 'profile/:id', to: 'profiles#update'
  get 'profile/new', to: 'profile#new', as: 'new_profile'
  post 'profile', to: 'profiles#create'

  get 'pet/new/', to: 'pet#new', as: 'new_pet'
  post 'pet', to: 'pets#create'
  patch '/pet.:id', to: 'pets#update'
  get 'pet/:pet_id', to: 'pets#show', as: 'view_pet'
  get 'pet/:id/edit/', to: 'pets#edit', as: 'edit_pet'
  post 'pet/:id/edit/', to: 'pets#edit'

  resource :profiles do
    member do
      get 'profile_pic'
      delete :delete_profile_pic
    end
  end

  resource :pets do
    member do
      get 'pet_pics'
      delete :delete_pet_pics
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
