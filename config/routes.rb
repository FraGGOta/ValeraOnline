Rails.application.routes.draw do
  get 'hello/index'
  get 'game' => 'game#index'
  get 'menu' => 'menu#index'
  post "game" => "menu#on_click_button_play"
end
