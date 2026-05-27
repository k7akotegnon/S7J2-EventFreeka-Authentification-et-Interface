Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker


  # 1. Définit la page d'accueil sur l'index des événements
  root 'events#index'

  # 2. Utilise resources pour générer les 7 routes REST pour les événements
  resources :events

  # 3. Ajoute une route pour afficher le profil d'un utilisateur
  resources :users, only: [:show]
end
