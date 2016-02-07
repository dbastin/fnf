Rails.application.routes.draw do
  root 'home#show'

  get 'login' => 'login#show'
  post 'login' => 'login#create'
  post 'logout' => 'login#destroy', as: :logout

  get 'welcome' => 'welcome#show'

  resources :loans, only: %i(new create show)

  get 'pledges/new/:id' => 'pledges#new', as: 'new_pledge'
  resources :pledges, only: %i(create show)

  resource :borrowers, only: %i(new create)

  resource :lenders, only: %i(create)
  get 'lenders/new(/:invitation_code)' => 'lenders#new', as: 'new_lenders'

  resource :invitations, only: %i(new create)
end
