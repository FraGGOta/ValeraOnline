Rails.application.routes.draw do
  root 'menu#index'
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  get 'log_in' => 'sessions#new'
  get 'sign_up' => 'accounts#new'
  get 'save' => 'saves#new'
  get 'load' => 'loads#new'
  get 'profile' => 'profiles#index'
  post 'play_btn' => 'menu#on_click_button_play'
  post 'load_btn' => 'menu#on_click_button_load'
  post 'save_btn' => 'menu#on_click_button_save'
  post 'menu' => 'game#on_click_button_exit'
  post 'log_in' => 'menu#on_click_button_login'
  post 'sign_up' => 'menu#on_click_button_signup'
  post 'log_out' => 'menu#on_click_button_logout'
  post 'go_job' => 'game#action_go_job'
  post 'go_behold' => 'game#action_go_behold'
  post 'watch_series' => 'game#action_watch_series'
  post 'go_bar' => 'game#action_go_bar'
  post 'go_drink' => 'game#action_go_drink'
  post 'go_sleep' => 'game#action_go_sleep'
  post 'go_sing' => 'game#action_go_sing'
  post 'new_game' => 'game#start_new_game'
  post 'profile' => 'menu#on_click_profile'
  resources :accounts
  resources :sessions
  resources :profiles
  resources :saves
  resources :loads
end
