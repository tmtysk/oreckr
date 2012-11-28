Oreckr::Application.routes.draw do
  resources :settings, except: [:update, :edit, :destroy]

  resources :albums, except: [:destroy] do
    resources :photos
  end

  root :to => 'home#index'
end
