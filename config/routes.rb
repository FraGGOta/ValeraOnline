Rails.application.routes.draw do
  root 'menu#index'
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  get 'log_in' => 'sessions#new'
  get 'sign_up' => 'accounts#new'
  post "game" => "menu#on_click_button_play"
  post "menu" => "game#on_click_button_exit"
  post "log_in" => "menu#on_click_button_login"
  post "sign_up" => "menu#on_click_button_signup"
  post "log_out" => "menu#on_click_button_logout"
  resources :accounts
  resources :sessions
end
