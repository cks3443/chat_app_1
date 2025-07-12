Rails.application.routes.draw do
  devise_for :users

  # 기본 경로 정의
  root "home#index"

  # 사용자 관련 경로
  resources :users, only: [:index, :show]

  # 대화 및 메시지 관련 경로
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
