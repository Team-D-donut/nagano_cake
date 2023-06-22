Rails.application.routes.draw do
  
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 scope module: :public do
 root to: 'homes#top'
 get '/about', to: 'homes#about'
 resources :items, only: %i[index show]
 resources :customers, only: [] do

 collection do
 get 'show', to: 'customers#show', as: 'current_customer'
 get 'information/edit', to: 'customers#edit', as: 'edit_current_customer'
 patch 'update', to: 'customers#update', as: 'update_current_customer'
 get 'confirm', to: 'customers#confirm', as: 'confirm_current_customer'
 patch 'withdraw', to: 'customers#withdraw', as: 'withdraw_current_customer'
 end
end

resources :cart_items, only: %i[index create destroy] do
 collection do
  delete :destroy_all
 end
end

resources :orders, only: %i[new create index show] do
  collection do
    post :confirm
    get :complete
  end
end
resources :addresses, only: %i[index edit create update]
delete 'addresses/:id' => 'addresses#destroy', as: 'destroy_address'
end


namespace :admin do
  root to: 'homes#top'
  resources :items, only: %i[index new create show edit update]
  resources :genres, only: %i[index create edit update]
  resources :customers, only: %i[index show edit update]
  resources :orders, only: %i[show update]
  resources :ordered_items, only: %i[update]
end
end