Rails.application.routes.draw do
  get 'linkgen/index'

  get 'link/index'

  get 'link_generator/index'

  resources :sign_ups
  resources :entries
  root to: "sign_ups#new"

  get 'panel/:id', to: 'panel#index', as: 'panel'
  get 'entries/', to: 'entries#index', as: 'all_entries'
  get 'link/', to: 'link#index', as: 'link'
  # root to: "entries#index"
end
