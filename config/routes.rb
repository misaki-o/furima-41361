Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :destroy, :update]

   #ルーティングのネスト　詳細→注文ページ

  #  resources :items, only:  :new  do
    #  resources :orders, only: [:index, :create]
  #  end

   resources :items do
    resources :orders, only: [:index, :create]
   end

  end
