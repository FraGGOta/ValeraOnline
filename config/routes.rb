Rails.application.routes.draw do
  root 'menu#index'
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  get 'log_in' => 'log_in#index'
  get 'sign_in' => 'accounts#new'
  post "game" => "menu#on_click_button_play"
  post "menu" => "game#on_click_button_exit"
  post "log_in" => "menu#on_click_button_login"
  post "sign_in" => "menu#on_click_button_signin"
  post 'menu' => 'accounts#on_click_button_submit'
  resources :accounts
end
