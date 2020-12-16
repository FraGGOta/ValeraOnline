Rails.application.routes.draw do
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  get 'log_in' => 'log_in#index'
  get 'sign_in' => 'sign_in#index'
  post "game" => "menu#on_click_button_play"
  post "log_in" => "menu#on_click_button_login"
  post "sign_in" => "menu#on_click_button_signin"
end
