PersonalSite::Application.routes.draw do
  
  devise_for :users
  # get "blogs/index"
  # get "blogs/show"
  # get "blogs/edit"
  # get "blogs/new"
  # get "pages/index"
  # get "pages/aboutme"
  # get "pages/resume"
  # get "pages/contact"
  # get "pages/portfolio"
  root 'pages#index'

  get '/aboutme' => 'pages#aboutme', as: 'aboutme'
  get '/index' => 'pages#index', as: 'home'

  get '/resume' => 'pages#resume', as: 'resume'

  get '/contact' => 'pages#contact', as: 'contact'
  get '/portfolio' => 'pages#portfolio', as: 'portfolio'

  get '/signin' => 'pages#signin', as: 'signin'

  resources :blogs
  
  resources :users
end
