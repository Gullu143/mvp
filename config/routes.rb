Rails.application.routes.draw do

  root 'index#home'
  get '/about', to: 'index#about', as: 'about'
  resources :articles
  devise_for :buyers
  get 'admin_dashboard', to:'admin#admin_dashboard', as:'admin_dashboard'
  get 'search', to: 'search#search', as: 'search'
  resources :comments

  # sellers link
  devise_for :sellers, :controllers => { sessions: "sellers/sessions", registrations: "sellers/registrations"}
  authenticated :seller do
    get '/sellers/profile', to:'sellers#profile', as:'sellers/profile'
    get '/sellers/my_draft', to:'sellers#my_draft', as:'sellers/my_draft'
  end
        
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
