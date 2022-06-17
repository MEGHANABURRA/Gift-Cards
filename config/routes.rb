Rails.application.routes.draw do
  get 'pages/secret'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  get 'users_new' => 'users#new'
  post 'users'=>'users#create'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/logout' => 'sessions#destroy'

  
  get 'orders/new' => 'orders#new', as: :new_order
  post 'orders'=>'orders#create'
  get 'orders'=>'orders#show'
  get 'orders/monthly_report' => 'orders#monthly_report'
  get 'orders/admin/history' => 'orders#admin_history'
  get 'orders/admin/orders/:id/edit' => 'orders#update_status'
  put 'orders/admin/orders/:id/edit' => 'orders#update'
  post '/orders/admin/orders/:id/edit' => 'orders#update'
  patch '/orders/admin/orders/:id/edit' => 'orders#update'
end
