Rails.application.routes.draw do
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create] do
  #index
  #show
  #new
  #create
    resources :doses, only: [:new, :create]
    #new
    #create
  end

  resources :doses, only: [:destroy]
  #destroy
end
